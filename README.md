# digio-ios-app
Este app iOS é um teste para a vaga de desenvolvedor sênior na Digio.

## Requisitos
- Swift 4.2
- Versão mínima do iOS: 12.0
- SwiftLint
- Testes

## Arquitetura

A arquitetura escolhida foi o MVP (Model - View - Presenter).

A idéia é bastante similar ao MVVM, com a diferença de que o MVP não é "reativo", logo a conexão entre a camada de negócios e de apresentação é feita de forma explícita (seja utilizando delegates ou closures). Aqui estamos utilizando o padrão de delegates.

### Model
Mapeia as entidades da aplicação. Aqui estamos utilizando o conceito de modelos de domínio e [DTOs](https://martinfowler.com/bliki/LocalDTO.html).

- Os modelos de domínio mapeiam as entidades de forma que façam sentido para aplicação.

- Os DTOs mapeiam as entidades conforme existem fora da aplicação. Por não termos controle sobre APIs externas ao nosso código, o ideal é que os DTOs sejam mapeados para nossos modelos de domínio.

### View
Camada de apresentação da aplicação. Recebe os inputs e renderiza o layout.

### Presenter
Camada de negócio da aplicação, responsável por regras de negócio e utilizar a camada de Service para execução de chamadas de API. Essa camada "conhece" o delegate da camada de view, a camada de serviço e (só e somente só) os o modelos de domínio da aplicação.

### Service
Camada de serviço responsável por executar requisições e tratar o retorno. Essa camada é quem é responsável por mapear os DTOs para os modelos de domínio utilizados pelo restante da aplicação.

## View Code
Este projeto utilza o conceito de [View Code](https://betterprogramming.pub/ios-view-codes-handbook-1a08e28b0420). 
O protocolo `ViewCodable` utilza o conceito de [Template Method](https://refactoring.guru/design-patterns/template-method) para agrupar a ordem na qual os layouts precisam ser compostos (hirarquia dos componentes -> adição das constraints -> demais configurações).
Para criação das constraints eu utilizei no projeto uma extensão já existente - feita por mim para uso em projetos pessoais. Consiste em uma extensão de UIView+ que abstrai a utilização da classe nativa de constraints do UIKit e utiliza o conceito de [Fluent Interface](https://www.martinfowler.com/bliki/FluentInterface.html?ref=blog.codinghorror.com) para deixar o código mais limpo.

## Testes
Apenas a camada de negócio está sendo testada. Para facilitar os testes o conceito de [Dependency Injection](https://www.avanderlee.com/swift/dependency-injection/) está sendo utilizado, visando _mockar_ a camada de serviço.

A ideia seria também testar a camada de serviço, utilizando o mesmo princípio e _mockando_ o `URLSession.shared`.

O Projeto utiliza a funcionalidade de [Test Plans](https://developer.apple.com/documentation/xcode/organizing-tests-to-improve-feedback), que além de organizar os testes facilita na execução dos testes via `xcbuildtool` local ou via CI.

### Automação
O projeto está integrado com Github actions ([ver workflows](https://github.com/pedrofveloso/digio-ios-app/actions)). E está rodando os testes unitários a cada push.
Os testes unitários estão sendo executados via `xcbuildtool`.

## Bibliotecas
- [SwiftLint Plugins](https://github.com/realm/swiftlint?tab=readme-ov-file#swift-package-projects).
