import 'package:flutter/foundation.dart';

class AppStrings extends ChangeNotifier {
  static final AppStrings instance = AppStrings._();

  AppStrings._();

  static const String _appNamePt = 'Bem-vindo(a) ao Meu Currículo Online';
  static const String _appNameEn = 'Welcome to My Online Curriculum';
  static String get appName => _select(_appNamePt, _appNameEn);

  static const String personalName = 'João Marques da Silva';

  static const String _flutterShortRole = 'Flutter';
  static const String _flutterRolePt = 'Desenvolvedor Flutter';
  static const String _flutterRoleEn = 'Flutter Developer';
  static String flutterRole(bool isShort) {
    return isShort
      ? _flutterShortRole
      : _select(_flutterRolePt, _flutterRoleEn);
  }

  static const String _integrationShortRole = 'SAP Integration Suite';
  static const String _integrationRolePt = 'Desenvolvedor SAP Integration Suite';
  static const String _integrationRoleEn = 'SAP Integration Suite Developer';
  static String integrationRole(bool isShort) {
    return isShort
      ? _integrationShortRole
      : _select(_integrationRolePt, _integrationRoleEn);
  }


  static const String _profSummaryTitlePt = 'Resumo Profissional';
  static const String _profSummaryTitleEn = 'Professional Summary';
  static String get professionalSummaryTitle => _select(_profSummaryTitlePt, _profSummaryTitleEn);

  static const String _profSummaryInfoPt =
    'Desenvolvedor profissional com mais de 15 anos de experiência atuando em aplicações '
    'comerciais cliente/servidor (ERP), aplicativos móveis para a plataforma Android, '
    'design/desenvolvimento de jogos casuais, e aplicações multiplataforma com o framework '
    'Flutter.';
  static const String _profSummaryInfoEn =
    'Professional developer with over 15 years of experience working on client/server commercial '
    'applications (ERP), mobile applications for the Android platform, design/development of '
    'casual games, and cross-platform applications using the Flutter framework.';
  static String get professionalSummaryInfo => _select(_profSummaryInfoPt, _profSummaryInfoEn);


  static const String _detailsTitlePt = 'Detalhes';
  static const String _detailsTitleEn = 'Details';
  static String get detailsTitle => _select(_detailsTitlePt, _detailsTitleEn);

  static const String _personalLocalPt = 'Brasil, GO';
  static const String _personalLocalEn = 'Brazil, GO';
  static String get personalLocal => _select(_personalLocalPt, _personalLocalEn);

  static const String personalPhone = '+55 62 99497-1154';
  static const String personalPhoneLink = 'https://api.whatsapp.com/send?phone=5562994971154';
  static const String personalEmail = 'jmsilva.inbox@gmail.com';
  static const String personalEmailLink = 'mailto:${personalEmail}';
  static const String personalGitHubLink = 'https://github.com/jmsil';


  static const String _progSkillsTitlePt = 'Habilidades Em Programação';
  static const String _progSkillsTitleEn = 'Programming Skills';
  static String get programmingSkillsTitle => _select(_progSkillsTitlePt, _progSkillsTitleEn);

  static const String programmingSkillsInfo =
    'Dart/Flutter - Android SDK - Java - C/C++ - Oracle Database - MySQL Database - '
    'SQL/PL SQL - Git';

  static const String _integSkillsTitlePt = 'Habilidades Em Integração';
  static const String _integSkillsTitleEn = 'Integration Skills';
  static String get integrationSkillsTitle => _select(_integSkillsTitlePt, _integSkillsTitleEn);

  static const String integrationSkillsInfo =
    'Cloud Integration - API Management - Advanced Event Mesh/Event Mesh - Open Connectors';


  static const String _aboutExpecTitlePt = 'Sobre Mim e Expectativas';
  static const String _aboutExpecTitleEn = 'About Me and Expectations';
  static String get aboutAndExpectationsTitle => _select(_aboutExpecTitlePt, _aboutExpecTitleEn);

  static const String _aboutExpecInfoPt =
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
  static const String _aboutExpecInfoEn =
    'A lover of digital illustration for games and passionate about the art of music.\n\n'

    'Always interested in learning more about any subject. When it comes to development, I '
    'prioritize sources such as books, official documentation, and articles.\n\n'

    'I always strive to do my best in everything I do, maintaining a high level of commitment '
    'to the quality of the final product. I value readability and performance, and that\'s why I '
    'chose Flutter as my cross-platform development framework.\n\n'

    'I hope to have the opportunity to participate in application development and/or system '
    'integration projects based on my demonstrated technical skills. While contributing my '
    'knowledge, I also hope to improve personally and technically alongside my teammates.';
  static String get aboutAndExpectationsInfo => _select(_aboutExpecInfoPt, _aboutExpecInfoEn);


  static const String _poweredByFlutterPt = 'Feito com Flutter  🩵';
  static const String _poweredByFlutterEn = 'Made with Flutter  🩵';
  static String get powredByFlutter => _select(_poweredByFlutterPt, _poweredByFlutterEn);


  static const String _experienceTitlePt = 'Experiência';
  static const String _experienceTitleEn = 'Experience';
  static String get experienceTitle => _select(_experienceTitlePt, _experienceTitleEn);


  static const String _fortlevXpTitlePt =
    'Desenvolvimento de Aplicativo Flutter Mobile';
  static const String _fortlevXpTitleEn =
    'Flutter Mobile Application Development';
  static String get fortlevExperienceTitle => _select(_fortlevXpTitlePt, _fortlevXpTitleEn);

  static const String _fortlevXpDetailPt = 'BCI/Fortlev ▪ Junho/2021 - Julho/2023';
  static const String _fortlevXpDetailEn = 'BCI/Fortlev ▪ June/2021 - July/2023';
  static String get fortlevExperienceDetail => _select(_fortlevXpDetailPt, _fortlevXpDetailEn);

  static const String bciShortLink = 'BCI Consulting.com';
  static const String bciLink = 'https://www.bci-consulting.com';
  static const String fortlevShortLink = 'Fortlev.com';
  static const String fortlevLink = 'https://www.fortlev.com.br';

  static const String _fortlevXpInfoPt =
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
  static const String _fortlevXpInfoEn =
    'I worked on the development of the "Mão Dupla" application for Freight Order management '
    'for the Fortlev company.\n'
    'The application aims to automate operations between the Freight and Transportation sector '
    'managers and Carrier and driver partners.\n\n'

    'As a Developer Analyst, I also contributed to functional and technical requirements '
    'gathering in collaboration with managers and users.\n\n'

    'The application has the main features:\n'
    '▪ User authentication;\n'
    '▪ Freight Orders and Invoices management;\n'
    '▪ Incident reporting during the journey;\n'
    '▪ Push Notifications for relevant events;\n'
    '▪ Offline First for no connection operations;\n'
    '▪ Help/support features such as Contacts, Tips, and FAQ.';
  static String get fortlevExperienceInfo => _select(_fortlevXpInfoPt, _fortlevXpInfoEn);


  static const String _smartNewXpTitlePt =
    'Desenvolvimento de Aplicação Flutter Mobile/Web';
  static const String _smartNewXpTitleEn =
    'Flutter Mobile/Web Application Development';
  static String get smartNewExperienceTitle => _select(_smartNewXpTitlePt, _smartNewXpTitleEn);

  static const String smartNewExperienceDetail = 'SmartNew System ▪ 2021';
  static const String smartNewShortLink = 'SmartNew System.com';
  static const String smartNewLink = 'https://telemetria.smartnewsystem.com';

  static const String _smartNewXpInfoPt =
    'Nos primeiros meses do ano, prestei consultoria para o desenvolvimento de um protótipo de '
    'uma aplicação mobile/web para a SmartNew, atuante no desenvolvimento de sistemas de '
    'monitoramento e gerenciamento de frotas. O objetivo era migrar a stack low-code em uso.';
  static const String _smartNewXpInfoEn =
    'In the first months of the year, I provided consulting services for the development of a '
    'mobile/web application prototype for SmartNew, which operates by developing fleet monitoring '
    'and management systems. The goal was to migrate the existing low-code stack.';
  static String get smartNewExperienceInfo => _select(_smartNewXpInfoPt, _smartNewXpInfoEn);


  static const String _mobGameXpTitlePt = 'Design/Desenvolvimento de Jogos Casuais';
  static const String _mobGameXpTitleEn = 'Design/Development of Casual Games';
  static String get mobileGameExperienceTitle => _select(_mobGameXpTitlePt, _mobGameXpTitleEn);

  static const String mobileGameExperienceDetail = '2013 - 2020';

  static const String _mobGameXpInfoPt =
    'Trabalhei em um projeto pessoal de um jogo casual 2D para dispositivos móveis.\n\n'

    'Desenvolvi pequenos protótipos durante a fase de concepção do projeto final utilizando '
    'Android SDK/Java com views nativas.\n\n'

    'A primeira versão do motor foi desenvolvida com Java/OpenGL ES 1.0. Uma segunda versão '
    'foi desenvolvida com OpenGL ES 2.0+.\n\n'

    'Para tornar o jogo multiplataforma, portei o código para C++ e fiz alguns experimentos '
    'com Unity/C#.';
  static const String _mobGameXpInfoEn =
    'I worked on a personal project of a 2D casual game for mobile devices.\n\n'

    'I developed small prototypes during the conception phase of the final project using Android '
    'SDK/Java with native views.\n\n'

    'The first version of the engine was developed using Java/OpenGL ES 1.0. A second version '
    'was developed using OpenGL ES 2.0.\n\n'

    'To turn the game multiplatform, I converted the code to C++. I also made some experiments '
    'with Unity/C#.';
  static String get mobileGameExperienceInfo => _select(_mobGameXpInfoPt, _mobGameXpInfoEn);


  static const String _santriXpTitlePt = 'Desenvolvimento de Aplicação ERP';
  static const String _santriXpTitleEn = 'ERP Application Development';
  static String get santriExperienceTitle => _select(_santriXpTitlePt, _santriXpTitleEn);

  static const String _santriXpDetailPt = 'Santri Sistemas ▪ Outubro/2007 - Abril/2012';
  static const String _santriXpDetailEn = 'Santri Systems ▪ October/2007 - April/2012';
  static String get santriExperienceDetail => _select(_santriXpDetailPt, _santriXpDetailEn);

  static const String santriShortLink = 'Santri.com';
  static const String santriLink = 'https://www.santri.com.br';

  static const String _santriXpInfoPt =
    'Na Santri Sistemas, contribuí para o desenvolvimento da aplicação cliente/servidor ADM '
    'utilizando RAD Studio (Delphi) e banco de dados Oracle com SQL/PL SQL.\n\n'

    'Meu papel consistia em analisar, especificar e implementar as demandas dos clientes sob '
    'supervisão do Analista de Sistemas sênior.\n\n'

    'Como desenvolvedor mais experiente da equipe, minhas atribuições incluíam introduzir e '
    'auxiliar os novos membros com os padrões de desenvolvimento adotados. Também liderei uma '
    'pequena equipe por um curto período antes de deixar a empresa.';
  static const String _santriXpInfoEn =
    'At Santri Systems, I contributed to the development of the client/server application ADM '
    'using RAD Studio (Delphi) and the Oracle database with SQL/PL SQL.\n\n'

    'My role consisted of analyzing, specifying, and implementing the customer\’s requirements '
    'under the supervision of the Senior Systems Analyst.\n\n'

    'As the most experienced developer on the team, my responsibilities included introducing and '
    'assisting new members with the adopted development standards. I also led a small team for a '
    'short period before leaving the company.';
  static String get santriExperienceInfo => _select(_santriXpInfoPt, _santriXpInfoEn);


  static const String _smallErpXpTitlePt = 'Desenvolvimento de Aplicação ERP';
  static const String _smallErpXpTitleEn = 'ERP Application Development';
  static String get smallErpExperienceTitle => _select(_smallErpXpTitlePt, _smallErpXpTitleEn);

  static const String smallErpExperienceDetail = '2006/2007';

  static const String _smallErpXpInfoPt =
    'Desenvolvi uma pequena aplicação cliente/servidor utilizando RAD Studio (Delphi) e banco de '
    'dados MySQL para uma pequena loja de materiais para construção em minha cidade.\n\n'

    'Nesse projeto, pude aplicar os conhecimentos que adquiria na faculdade e estudos individuais '
    'do livro Dominando o Delphi ▪ A Bíblia.';
  static const String _smallErpXpInfoEn =
    'I developed a small client/server application using RAD Studio (Delphi) and the MySQL '
    'database for a little building materials store in my city.\n\n'

    'In this project, I was able to apply the knowledge I was acquiring in my graduation and '
    'through individual studies of the book Mastering Delphi ▪ The Bible.';
  static String get smallErpExperienceInfo => _select(_smallErpXpInfoPt, _smallErpXpInfoEn);


  static const String _educationTitlePt = 'Formação';
  static const String _educationTitleEn = 'Education';
  static String get educationTitle => _select(_educationTitlePt, _educationTitleEn);


  static const String _eduUniTitlePt = 'Redes de Computadores';
  static const String _eduUniTitleEn = 'Computer Networks';
  static String get educationUniversityTitle => _select(_eduUniTitlePt, _eduUniTitleEn);

  static const String _eduUniDetailPt = 'Faculdade Estácio de Sá ▪ 2006 - 2008';
  static const String _eduUniDetailEn = 'Estácio de Sá University ▪ 2006 - 2008';
  static String get educationUniversityDetail => _select(_eduUniDetailPt, _eduUniDetailEn);

  static const String educationUniversityShortLink = 'Estacio.com';
  static const String educationUniversityLink = 'https://estacio.br';

  static const String _eduUniInfoPt =
    'O curso abordou todos os fundamentos teóricos e práticos envolvidos em arquitetura de redes '
    'de computadores.\n\n'

    'Também incluiu: Sistemas Digitais, Sistemas Operacionais, Estrutura de Dados e Algorítimos, '
    'e uma introdução a linguagens de programação como C e Java.';
  static const String _eduUniInfoEn =
    'The course covered all the theoretical and practical fundamentals involved in computer '
    'network architecture.\n\n'

    'It also included: Digital Systems, Operating Systems, Data Structure & Algorithms, and an '
    'introduction to programming languages such as C and Java.';
  static String get educationUniversityInfo => _select(_eduUniInfoPt, _eduUniInfoEn);


  static const String _coursesBooksTitlePt = 'Cursos e Livros Relevantes';
  static const String _coursesBooksTitleEn = 'Relevant Courses and Books';
  static String get coursesAndBooksTitle => _select(_coursesBooksTitlePt, _coursesBooksTitleEn);

  static const String _coursesTitlePt = 'Cursos';
  static const String _coursesTitleEn = 'Courses';
  static String get coursesTitle => _select(_coursesTitlePt, _coursesTitleEn);

  static const String _booksTitlePt = 'Livros';
  static const String _booksTitleEn = 'Books';
  static String get booksTitle => _select(_booksTitlePt, _booksTitleEn);

  static const String _bookDelphiTitlePt = 'Dominando o Delphi ▪ A Bíblia';
  static const String _bookDelphiTitleEn = 'Mastering Delphi ▪ The Bible';
  static String get bookDelphiBibleTitle => _select(_bookDelphiTitlePt, _bookDelphiTitleEn);

  static const String bookDelphiBibleDetail = 'Marco Cantù';


  static const String _bookAndroidTitlePt =
    'Google Android ▪ Aplicações Móveis com o Android SDK';
  static const String _bookAndroidTitleEn =
    'Google Android ▪ Mobile Applications with the Android SDK';
  static String get bookGoogleAndroidTitle => _select(_bookAndroidTitlePt, _bookAndroidTitleEn);

  static const String bookGoogleAndroidDetail = 'Ricardo R. Lecheta';


  static const String bookCleanCodeTitle =
    'Clean Code ▪ A Handbook of Agile Software Craftsmanship';
  static const String bookCleanArchitectureTitle =
    'Clean Architecture ▪ A Craftsman\'s Guide to Software Structure and Design';
  static const String booksCleanCodeArchDetail = 'Robert C. Martin';


  static const String bookEnterpriseIntegrationPatternsTitle = 'Enterprise Integration Patterns';
  static const String bookEnterpriseIntegrationPatternsDetail = 'Gregor Hohpe & Bobby Woolf';


  static const String _courseOracleTitlePt = 'Guia Para os Exames de Certificação OCA/OCP Oracle';
  static const String _courseOracleTitleEn = 'Oracle OCA/OCP Certification Exams Guide';
  static String get courseOracleTitle => _select(_courseOracleTitlePt, _courseOracleTitleEn);

  static const String courseOracleDetail = '2010';


  static const String _courseCiImmTitlePt = 'Imersão SAP Cloud Integration';
  static const String _courseCiImmTitleEn = 'SAP Cloud Integration Immersion';
  static String get courseSapCloudIntegrationImmersionTitle => _select(
    _courseCiImmTitlePt, _courseCiImmTitleEn
  );

  static const String courseSapCloudIntegration20Title = 'SAP Cloud Integration 2.0';
  static const String courseSapApiManagementTitle = 'SAP API Management';
  static const String courseSapAdvancedEventMeshTitle = 'SAP Advanced Event Mesh';

  static const String coursesSapDetail = 'Moovi Education ▪ 2025';
  static const String mooviEducationShortLink = 'Moovi Education.com';
  static const String mooviEducationLink = 'https://moovi.education';


  static const String _languagesTitlePt = 'Idiomas';
  static const String _languagesTitleEn = 'Languages';
  static String get languagesTitle => _select(_languagesTitlePt, _languagesTitleEn);

  static const String _languagesInfoPt =
    'Português ▪ Nativo - '
    'Inglês\n'
    '▪ Leitura avançada\n'
    '▪ Escrita intermediária\n'
    '▪ Conversação técnica intermediária';
  static const String _languagesInfoEn =
    'Portuguese ▪ Native - '
    'English\n'
    '▪ Advanced reading\n'
    '▪ Intermediate writing\n'
    '▪ Intermediate technical conversation';
  static String get languagesInfo => _select(_languagesInfoPt, _languagesInfoEn);


  static const String _availabilityTitlePt = 'Disponibilidade';
  static const String _availabilityTitleEn = 'Availability';
  static String get availabilityTitle => _select(_availabilityTitlePt, _availabilityTitleEn);

  static const String _availabilityInfoPt =
    'Contrato Pessoa Jurídica (PREFERÍVEL)\n'
    '▪ Fixo ▪ Hora - '
    'Contrato Pessoa Física - '
    'Somente remoto - '
    'Freelance';
  static const String _availabilityInfoEn =
    'Independent contract (PREFERABLE)\n'
    '▪ Fixed ▪ Hour - '
    'Employee contract - '
    'Remote only - '
    'Freelance';
  static String get availabilityInfo => _select(_availabilityInfoPt, _availabilityInfoEn);



  static String _langCode = '';
  static String get langCode => _langCode;

  void setLanguage(String languageCode) {
    if (languageCode != _langCode) {
      _langCode = languageCode;
      notifyListeners();
    }
  }

  static String _select(String pt, String en) {
    return _langCode == 'pt' ? pt : en;
  }
}