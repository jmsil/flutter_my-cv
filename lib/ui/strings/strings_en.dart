import 'strings.dart';

class StringsEn extends Strings {
  final String _badRequestComplement = 'return 400 (Bad Request)';
  final String _unsupportedEndpointsPhrase =
    'Unsupported endpoints return 404 (Not Found).';
  final String _unsupportedMethodsPhrase =
    'Unsupported methods return 405 (Method Not Allowed).';
  final String _unsupportedMediaTypesPhrase =
    'Unsupported media types return 415 (Unsupported Media Type).';
  @override
  String get appName => 'Welcome to My Online Curriculum';
  @override
  String get flutterLongRole => 'Flutter Developer';
  @override
  String get integrationLongRole => 'SAP Integration Suite Developer';
  @override
  String get professionalSummaryTitle => 'Professional Summary';
  @override
  String get professionalSummaryInfo =>
    'Professional developer with over 15 years of experience working on client/server commercial '
    'applications (ERP), mobile applications for the Android platform, design/development of '
    'casual games, and cross-platform applications using the Flutter framework.';
  @override
  String get detailsTitle => 'Details';
  @override
  String get personalLocation => 'Brazil, GO';
  @override
  String get programmingSkillsTitle => 'Programming Skills';
  @override
  String get integrationSkillsTitle => 'Integration Skills';
  @override
  String get aboutAndExpectationsTitle => 'About Me and Expectations';
  @override
  String get aboutAndExpectationsInfo =>
    'A lover of digital illustration for games and passionate about the art of music.\n\n'

    'Always interested in learning more about any subject. When it comes to development, I '
    'prioritize sources such as books, official documentation, and articles.\n\n'

    'I always strive to do my best in everything I do, maintaining a high level of commitment '
    'to the quality of the final product. I value readability and performance, and that\'s why I '
    'chose Flutter as my cross-platform development framework.\n\n'

    'I hope to have the opportunity to participate in application development and/or system '
    'integration projects based on my demonstrated technical skills. While contributing my '
    'knowledge, I also hope to improve personally and technically alongside my teammates.';
  @override
  String get madeWithFlutter => 'Made with Flutter  🩵';
  @override
  String get language => 'Language';
  @override
  String get experienceTitle => 'Experience';
  @override
  String get sapIntegrationSuiteLearningJourneyTitle =>
    'SAP Integration Suite Learning Journey';
  @override
  String get sapIntegrationSuiteLearningJourneyDetail => 'Since 2023';
  @override
  String get integrationProjectApimProxyTitle => 'API Management Proxy';
  @override
  String get integrationProjectApimProxyDescription =>
    'Allow user applications to connect to Cloud Integration using a Firebase JWT token.';
  @override
  String get integrationProjectApimProxyInfo =>
    '${Strings.widgetPlaceholder}';
  @override
  String get integrationProjectCalculatorTitle => 'Calculator';
  @override
  String get integrationProjectCalculatorDescription =>
    'Consume the public web service Calculator (http://www.dneonline.com/calculator.asmx).';
  @override
  String get integrationProjectCalculatorInfo =>
    '${Strings.widgetPlaceholder}'

    'This iFlow implements a dynamic endpoint to support the four operations offered by the web '
    'service.\n\n'

    'The supported endpoints are:\n'
    '▪ GET - https://<service-instance-URL>/http/<iflow-endpoint>/add;\n'
    '▪ GET - https://<service-instance-URL>/http/<iflow-endpoint>/sub;\n'
    '▪ GET - https://<service-instance-URL>/http/<iflow-endpoint>/mult;\n'
    '▪ GET - https://<service-instance-URL>/http/<iflow-endpoint>/div.\n\n'

    '${_unsupportedEndpointsPhrase}\n'
    '${_unsupportedMethodsPhrase}\n\n'

    'The parameters are sent via URL in the format ?paramA=<value>&paramB=<value> and mapped '
    'to the SOAP request:'

    '${Strings.widgetPlaceholder}\n'

    'By reading the CamelHttpPath header, it is possible to identify the operation and configure '
    'the associated mappings and SOAP action:'

    '${Strings.widgetPlaceholder}';
  @override
  String get integrationProjectConversionsAndFtpTitle => 'Conversions and FTP';
  @override
  String get integrationProjectConversionsAndFtpDescription =>
    'Convert the payload from/to different formats and save the result to an FTP server.';
  @override
  String get integrationProjectConversionsAndFtpInfo =>
    '${Strings.widgetPlaceholder}'

    'This iFlow implements the most common conversions. The Content-Type header defines the '
    'source format. The Accept header defines the target format.\n\n'

    'The supported conversions are:\n'
    '▪ POST - text/csv to application/xml;\n'
    '▪ POST - application/json to application/xml;\n'
    '▪ POST - application/xml to text/csv;\n'
    '▪ POST - application/xml to application/json.\n\n'

    '${_unsupportedMethodsPhrase}\n'
    '${_unsupportedMediaTypesPhrase}\n'
    'Unsupported conversions ${_badRequestComplement}.\n\n'

    'The result is saved to an FTP server configured via externalized parameters.\n\n'

    'For demonstration purposes, the conversions between XML and JSON formats include namespace '
    'mappings.\n\n'

    'JSON to XML:'

    '${Strings.widgetPlaceholder}'
    '${Strings.widgetPlaceholder}\n'

    'XML to JSON:'

    '${Strings.widgetPlaceholder}'
    '${Strings.widgetPlaceholder}';
  @override
  String get integrationProjectExceptionHandlerTitle => 'Exception Handler';
  @override
  String get integrationProjectExceptionHandlerDescription =>
    'Handle exceptions, log payloads in the Message Processing Log, and send emails.';
  @override
  String get integrationProjectExceptionHandlerInfo =>
    '${Strings.widgetPlaceholder}'

    'This iFlow is responsible for exception handling of all introduced iFlows.\n'
    'Log creation and email sending can be configured (enabled/disabled) via externalized '
    'parameters, as well as the SMTP settings.\n\n'

    'Only unhandled exceptions trigger log creation and email sending. After processing, each '
    'iFlow propagates the unhandled exception to the Sender in the Throw Unhandled step.\n\n'

    'For testing purposes, the propagation of handled exceptions can be forced through the '
    'custom header _force-raise-exception sent by the Sender.\n\n'

    'The following scripts contain all the needed functions for handling mapped exceptions:'

    '${Strings.widgetPlaceholder}\n'

    'The second script is responsible for handling common request settings. Each iFlow defines '
    'its settings.\n'
    'The following example demonstrates the supported settings:'

    '${Strings.widgetPlaceholder}';
  @override
  String get integrationProjectSqlServerWithXsltTitle => 'SQL Server with XSLT';
  @override
  String get integrationProjectSqlServerWithXsltDescription =>
    'Connect to a SQL Server database via JDBC and perform basic operations.';
  @override
  String get integrationProjectSqlServerWithXsltInfo =>
    '${Strings.widgetPlaceholder}'

    'This iFlow uses XSLT to transform a JSON request into the XML format required by the '
    'JDBC adapter.\n\n'

    'The supported operations are:\n'
    '▪ GET - SELECT;\n'
    '▪ POST - INSERT;\n'
    '▪ PATCH - UPDATE.\n\n'

    '${_unsupportedMethodsPhrase}\n\n'

    'By reading the CamelHttpMethod header, it is possible to configure the associated payload '
    'validation schema and the XSLT mapping:'

    '${Strings.widgetPlaceholder}\n'

    'The following example demonstrates the implementation of the SELECT operation:'

    '${Strings.widgetPlaceholder}';
  @override
  String get fortlevExperienceTitle => 'Flutter Mobile Application Development';
  @override
  String get fortlevExperienceDetail => 'BCI/Fortlev ▪ June/2021 - July/2023';
  @override
  String get fortlevExperienceInfo =>
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
  @override
  String get smartNewExperienceTitle => 'Flutter Mobile/Web Application Development';
  @override
  String get smartNewExperienceInfo =>
    'In the first months of the year, I provided consulting services for the development of a '
    'mobile/web application prototype for SmartNew, which operates by developing fleet monitoring '
    'and management systems. The goal was to migrate the existing low-code stack.';
  @override
  String get mobileGameExperienceTitle => 'Design/Development of Casual Games';
  @override
  String get mobileGameExperienceInfo =>
    'I worked on a personal project of a 2D casual game for mobile devices.\n\n'

    'I developed small prototypes during the conception phase of the final project using Android '
    'SDK/Java with native views.\n\n'

    'The first version of the engine was developed using Java/OpenGL ES 1.0. A second version '
    'was developed using OpenGL ES 2.0.\n\n'

    'To turn the game multiplatform, I converted the code to C++. I also made some experiments '
    'with Unity/C#.';
  @override
  String get santriExperienceTitle => 'ERP Application Development';
  @override
  String get santriExperienceDetail => 'Santri Systems ▪ October/2007 - April/2012';
  @override
  String get santriExperienceInfo =>
    'At Santri Systems, I contributed to the development of the client/server application ADM '
    'using RAD Studio (Delphi) and the Oracle database with SQL/PL SQL.\n\n'

    'My role consisted of analyzing, specifying, and implementing the customer\’s requirements '
    'under the supervision of the Senior Systems Analyst.\n\n'

    'As the most experienced developer on the team, my responsibilities included introducing and '
    'assisting new members with the adopted development standards. I also led a small team for a '
    'short period before leaving the company.';
  @override
  String get smallErpExperienceTitle => 'ERP Application Development';
  @override
  String get smallErpExperienceInfo =>
    'I developed a small client/server application using RAD Studio (Delphi) and the MySQL '
    'database for a little building materials store in my city.\n\n'

    'In this project, I was able to apply the knowledge I was acquiring in my graduation and '
    'through individual studies of the book Mastering Delphi ▪ The Bible.';
  @override
  String get educationTitle => 'Education';
  @override
  String get educationUniversityTitle => 'Computer Networks';
  @override
  String get educationUniversityDetail => 'Estácio de Sá University ▪ 2006 - 2008';
  @override
  String get educationUniversityInfo =>
    'The course covered all the theoretical and practical fundamentals involved in computer '
    'network architecture.\n\n'

    'It also included: Digital Systems, Operating Systems, Data Structure & Algorithms, and an '
    'introduction to programming languages such as C and Java.';
  @override
  String get coursesAndBooksTitle => 'Relevant Courses and Books';
  @override
  String get coursesTitle => 'Courses';
  @override
  String get booksTitle => 'Books';
  @override
  String get bookDelphiBibleTitle => 'Mastering Delphi ▪ The Bible';
  @override
  String get bookGoogleAndroidTitle =>
    'Google Android ▪ Mobile Applications with the Android SDK';
  @override
  String get courseOracleTitle => 'Oracle OCA/OCP Certification Exams Guide';
  @override
  String get courseSapCloudIntegrationImmersionTitle => 'SAP Cloud Integration Immersion';
  @override
  String get courseSapCloudIntegrationImmersionDetail => 'Moovi Education ▪ 05/2025 ▪ 16 hours';
  @override
  String get verifyCertificate => 'Verify certificate';
  @override
  String get languagesTitle => 'Languages';
  @override
  String get languagesInfo =>
    'Portuguese ▪ Native - '
    'English\n'
    '▪ Advanced reading\n'
    '▪ Intermediate writing\n'
    '▪ Intermediate technical conversation';
  @override
  String get availabilityTitle => 'Availability';
  @override
  String get availabilityInfo =>
    'Independent contract (PREFERABLE)\n'
    '▪ Fixed\n'
    '▪ Hour - '
    'Employee contract - '
    'Remote only - '
    'Freelance';
}