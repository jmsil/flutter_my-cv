import 'strings.dart';

class StringsPt extends Strings {
  final String _badRequestComplement = 'retornam 400 (Bad Request)';
  final String _unsupportedEndpointsPhrase =
    'Endpoints não suportados retornam 404 (Not Found).';
  final String _unsupportedMethodsPhrase =
    'Métodos não suportados retornam 405 (Method Not Allowed).';
  final String _unsupportedMediaTypesPhrase =
    'Tipos de mídia não suportados retornam 415 (Unsupported Media Type).';
  @override
  String get appName => 'Bem-vindo(a) ao Meu Currículo Online';
  @override
  String get flutterLongRole => 'Desenvolvedor Flutter';
  @override
  String get integrationLongRole => 'Desenvolvedor SAP Integration Suite';
  @override
  String get professionalSummaryTitle => 'Resumo Profissional';
  @override
  String get professionalSummaryInfo =>
    'Desenvolvedor profissional com mais de 15 anos de experiência atuando em aplicações '
    'comerciais cliente/servidor (ERP), aplicativos móveis para a plataforma Android, '
    'design/desenvolvimento de jogos casuais, e aplicações multiplataforma com o framework '
    'Flutter.';
  @override
  String get detailsTitle => 'Detalhes';
  @override
  String get personalLocation => 'Brasil, GO';
  @override
  String get programmingSkillsTitle => 'Habilidades Em Programação';
  @override
  String get integrationSkillsTitle => 'Habilidades Em Integração';
  @override
  String get aboutAndExpectationsTitle => 'Sobre Mim e Expectativas';
  @override
  String get aboutAndExpectationsInfo =>
    'Apreciador de ilustração digital para jogos e apaixonado pela arte da música.\n\n'

    'Sempre interessado em aprender mais sobre qualquer assunto. Sobre desenvolvimento, priorizo '
    'fontes como livros, documentações oficiais, e artigos.\n\n'

    'Busco sempre dar o meu melhor em tudo o que faço, mantendo um alto nível de comprometimento '
    'com a qualidade do produto final. Valorizo legibilidade e performance e, por isso, escolhi o '
    'Flutter como meu framework de desenvolvimento multiplataforma.\n\n'

    'Espero ter a oportunidade de participar de projetos de desenvolvimento de aplicações e/ou '
    'integrações de sistemas com base nas minhas habilidades técnicas apresentadas. Enquanto '
    'contribuo com meus conhecimentos, também espero aprimorar-me pessoal e tecnicamente com '
    'meus colegas de equipe.';
  @override
  String get madeWithFlutter => 'Feito com Flutter  🩵';
  @override
  String get experienceTitle => 'Experiência';
  @override
  String get sapIntegrationSuiteLearningJourneyTitle =>
    'Jornada de Estudos SAP Integration Suite';
  @override
  String get sapIntegrationSuiteLearningJourneyDetail => 'Desde 2023';
  @override
  String get integrationProjectApimProxyTitle => 'API Management Proxy';
  @override
  String get integrationProjectApimProxyDescription =>
    'Permite aplicações do usuário se conectarem ao Cloud Integration com um token JWT Firebase.';
  @override
  String get integrationProjectApimProxyInfo =>
    '${Strings.widgetPlaceholderWithBreak}';
  @override
  String get integrationProjectCalculatorTitle => 'Calculadora';
  @override
  String get integrationProjectCalculatorDescription =>
    'Consome o web service público Calculator (http://www.dneonline.com/calculator.asmx).';
  @override
  String get integrationProjectCalculatorInfo =>
    '${Strings.widgetPlaceholderWithBreak}'

    'Este iFlow implementa um endpoint dinâmico para atender às quatro operações oferecidas pelo '
    'web service.\n\n'

    'Os endpoints suportados são:\n'
    '▪ GET - https://<service-instance-URL>/http/<iflow-endpoint>/add;\n'
    '▪ GET - https://<service-instance-URL>/http/<iflow-endpoint>/sub;\n'
    '▪ GET - https://<service-instance-URL>/http/<iflow-endpoint>/mult;\n'
    '▪ GET - https://<service-instance-URL>/http/<iflow-endpoint>/div.\n\n'

    '${_unsupportedEndpointsPhrase}\n'
    '${_unsupportedMethodsPhrase}\n\n'

    'Os parâmetros são enviados via URL no formato ?paramA=<value>&paramB=<value> e mapeados '
    'para a requisição SOAP:'

    '${Strings.widgetPlaceholderWithBreak}\n'

    'Através do cabeçalho CamelHttpPath é possível identificar a operação e configurar os '
    'mapeamentos e ação SOAP correspondentes:'

    '${Strings.widgetPlaceholderWithBreak}';
  @override
  String get integrationProjectConversionsAndFtpTitle => 'Conversões e FTP';
  @override
  String get integrationProjectConversionsAndFtpDescription =>
    'Converte o payload de/para diferentes formatos e salva o resultado em um servidor FTP.';
  @override
  String get integrationProjectConversionsAndFtpInfo =>
    '${Strings.widgetPlaceholderWithBreak}'

    'Este iFlow implementa as conversões mais comuns. O cabeçalho Content-Type define o formato '
    'de origem. O cabeçalho Accept define o formato de destino.\n\n'

    'As conversões suportadas são:\n'
    '▪ POST - text/csv para application/xml;\n'
    '▪ POST - application/json para application/xml;\n'
    '▪ POST - application/xml para text/csv;\n'
    '▪ POST - application/xml para application/json.\n\n'

    '${_unsupportedMethodsPhrase}\n'
    '${_unsupportedMediaTypesPhrase}\n'
    'Conversões não suportadas ${_badRequestComplement}.\n\n'

    'O resultado é salvo em um servidor FTP configurado via parâmetros externalizados.\n\n'

    'Para efeito de demonstração, as conversões entre os formatos XML e JSON incluem '
    'mapeamento de namespaces.\n\n'

    'JSON para XML:'

    '${Strings.widgetPlaceholderWithBreak}'
    '${Strings.widgetPlaceholderWithBreak}\n'

    'XML para JSON:'

    '${Strings.widgetPlaceholderWithBreak}'
    '${Strings.widgetPlaceholderWithBreak}';
  @override
  String get integrationProjectExceptionHandlerTitle => 'Manipulador de Exceções';
  @override
  String get integrationProjectExceptionHandlerDescription =>
    'Trata exceções, registra payloads no Message Processing Log, e envia emails.';
  @override
  String get integrationProjectExceptionHandlerInfo =>
    '${Strings.widgetPlaceholderWithBreak}'

    'Este iFlow é responsável por tratar as exceções de todos os iFlows apresentados.\n'
    'A geração do log e o envio de email podem ser configurados (ativados/desativados) via '
    'parâmetros externalizados, bem como as configurações SMTP.\n\n'

    'Apenas exceções não tratadas geram log e envio de email. Após o processamento, cada iFlow '
    'propaga a exceção não tratada para o Sender na etapa Throw Unhandled.\n\n'

    'Para fins de testes, a propagação de exceções tratadas pode ser forçada através do '
    'cabeçalho customizado _force-raise-exception enviado pelo Sender.\n\n'

    'Os scripts abaixo contém todas as funções necessárias para o tratamento de exceções '
    'mapeadas:'

    '${Strings.widgetPlaceholderWithBreak}\n'

    'O segundo script é responsável por tratar configurações comuns de requisições. Cada iFlow '
    'define suas configurações.\n'
    'O exemplo abaixo demonstra as configurações suportadas:'

    '${Strings.widgetPlaceholderWithBreak}';
  @override
  String get integrationProjectSqlServerWithXsltTitle => 'SQL Server com XSLT';
  @override
  String get integrationProjectSqlServerWithXsltDescription =>
    'Conecta a um banco de dados SQL Server via JDBC e executa operações básicas.';
  @override
  String get integrationProjectSqlServerWithXsltInfo =>
    '${Strings.widgetPlaceholderWithBreak}'

    'Este iFlow utiliza XSLT para transformar uma requisição no formato JSON para o formato XML '
    'requerido pelo adaptador JDBC.\n\n'

    'As operações suportadas são:\n'
    '▪ GET - SELECT;\n'
    '▪ POST - INSERT;\n'
    '▪ PATCH - UPDATE.\n\n'

    '${_unsupportedMethodsPhrase}\n\n'

    'Através do cabeçalho CamelHttpMethod é possível configurar o esquema de validação do payload '
    'e o mapeamento XSLT correspondentes:'

    '${Strings.widgetPlaceholderWithBreak}\n'

    'O exemplo a seguir demonstra a implementação da operação SELECT:'

    '${Strings.widgetPlaceholderWithBreak}';
  @override
  String get fortlevExperienceTitle => 'Desenvolvimento de Aplicativo Flutter Mobile';
  @override
  String get fortlevExperienceDetail => 'BCI/Fortlev ▪ Junho/2021 - Julho/2023';
  @override
  String get fortlevExperienceInfo =>
    'Atuei no desenvolvimento do aplicativo "Mão Dupla" para gestão de Ordens de Frete para a '
    'companhia Fortlev.\n'
    'O aplicativo tem como objetivo automatizar as operações entre os gestores do setor de Carga '
    'e Transporte e Transportadoras e motoristas parceiros.\n\n'

    'Como Analista Desenvolvedor, também contribuí com levantamentos funcionais e técnicos em '
    'colaboração com os gestores e usuários.\n\n'

    'O aplicativo possui as principais funcionalidades:\n'
    '▪ Autenticação de usuários;\n'
    '▪ Gestão de Ordens de Frete e Notas Fiscais;\n'
    '▪ Reporte de incidentes durante o trajeto;\n'
    '▪ Push Notifications para eventos relevantes;\n'
    '▪ Offline First para permitir operações sem conexão;\n'
    '▪ Recursos de ajuda/suporte como Contatos, Dicas e FAQ.';
  @override
  String get smartNewExperienceTitle =>
     'Desenvolvimento de Aplicação Flutter Mobile/Web';
  @override
  String get smartNewExperienceInfo =>
    'Nos primeiros meses do ano, prestei consultoria para o desenvolvimento de um protótipo de '
    'uma aplicação mobile/web para a SmartNew, atuante no desenvolvimento de sistemas de '
    'monitoramento e gerenciamento de frotas. O objetivo era migrar a stack low-code em uso.';
  @override
  String get mobileGameExperienceTitle => 'Design/Desenvolvimento de Jogos Casuais';
  @override
  String get mobileGameExperienceInfo =>
    'Trabalhei em um projeto pessoal de um jogo casual 2D para dispositivos móveis.\n\n'

    'Desenvolvi pequenos protótipos durante a fase de concepção do projeto final utilizando '
    'Android SDK/Java com views nativas.\n\n'

    'A primeira versão do motor foi desenvolvida com Java/OpenGL ES 1.0. Uma segunda versão '
    'foi desenvolvida com OpenGL ES 2.0+.\n\n'

    'Para tornar o jogo multiplataforma, portei o código para C++ e fiz alguns experimentos '
    'com Unity/C#.';
  @override
  String get santriExperienceTitle => 'Desenvolvimento de Aplicação ERP';
  @override
  String get santriExperienceDetail => 'Santri Sistemas ▪ Outubro/2007 - Abril/2012';
  @override
  String get santriExperienceInfo =>
    'Na Santri Sistemas, contribuí para o desenvolvimento da aplicação cliente/servidor ADM '
    'utilizando RAD Studio (Delphi) e banco de dados Oracle com SQL/PL SQL.\n\n'

    'Meu papel consistia em analisar, especificar e implementar as demandas dos clientes sob '
    'supervisão do Analista de Sistemas sênior.\n\n'

    'Como desenvolvedor mais experiente da equipe, minhas atribuições incluíam introduzir e '
    'auxiliar os novos membros com os padrões de desenvolvimento adotados. Também liderei uma '
    'pequena equipe por um curto período antes de deixar a empresa.';
  @override
  String get smallErpExperienceTitle => 'Desenvolvimento de Aplicação ERP';
  @override
  String get smallErpExperienceInfo =>
    'Desenvolvi uma pequena aplicação cliente/servidor utilizando RAD Studio (Delphi) e banco de '
    'dados MySQL para uma pequena loja de materiais para construção em minha cidade.\n\n'

    'Nesse projeto, pude aplicar os conhecimentos que adquiria na faculdade e estudos individuais '
    'do livro Dominando o Delphi ▪ A Bíblia.';
  @override
  String get educationTitle => 'Formação';
  @override
  String get educationUniversityTitle => 'Redes de Computadores';
  @override
  String get educationUniversityDetail => 'Faculdade Estácio de Sá ▪ 2006 - 2008';
  @override
  String get educationUniversityInfo =>
    'O curso abordou todos os fundamentos teóricos e práticos envolvidos em arquitetura de redes '
    'de computadores.\n\n'

    'Também incluiu: Sistemas Digitais, Sistemas Operacionais, Estrutura de Dados e Algoritmos, '
    'e uma introdução a linguagens de programação como C e Java.';
  @override
  String get coursesAndBooksTitle => 'Cursos e Livros Relevantes';
  @override
  String get coursesTitle => 'Cursos';
  @override
  String get booksTitle => 'Livros';
  @override
  String get bookDelphiBibleTitle => 'Dominando o Delphi ▪ A Bíblia';
  @override
  String get bookGoogleAndroidTitle =>
     'Google Android ▪ Aplicações Móveis com o Android SDK';
  @override
  String get courseOracleTitle => 'Guia Para os Exames de Certificação OCA/OCP Oracle';
  @override
  String get courseSapCloudIntegrationImmersionTitle => 'Imersão SAP Cloud Integration';
  @override
  String get courseSapCloudIntegrationImmersionDetail => 'Moovi Education ▪ 05/2025 ▪ 16 horas';
  @override
  String get verifyCertificate => 'Verificar certificado';
  @override
  String get languagesTitle => 'Idiomas';
  @override
  String get languagesInfo =>
    'Português ▪ Nativo - '
    'Inglês\n'
    '▪ Leitura avançada\n'
    '▪ Escrita intermediária\n'
    '▪ Conversação técnica intermediária';
  @override
  String get availabilityTitle => 'Disponibilidade';
  @override
  String get availabilityInfo =>
    'Contrato Pessoa Jurídica (PREFERÍVEL)\n'
    '▪ Fixo\n'
    '▪ Hora - '
    'Contrato Pessoa Física - '
    'Somente remoto - '
    'Freelance';
}