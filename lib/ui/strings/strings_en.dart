import 'strings.dart';

class StringsEn extends Strings {
  StringsEn() : super(
    appName: 'Welcome to My Online Resume',
    roles:
      'Flutter Developer\n'
      'SAP Integration Suite Developer',
    professionalSummaryTitle: 'Professional Summary',
    professionalSummaryInfo: 'Senior software developer with over 15 years of experience in client-server commercial applications (ERP), Android mobile apps, casual game design and development, and cross-platform applications using the Flutter framework.',
    detailsTitle: 'Details',
    personalLocation: 'Goiás, Brazil',
    programmingSkillsTitle: 'Programming Skills',
    integrationSkillsTitle: 'Integration Skills',
    aboutAndExpectationsTitle: 'About Me and Expectations',
    aboutAndExpectationsInfo:
      'Passionate about digital illustration for games and the art of music.\n\n'

      'I am a lifelong learner who loves diving deep into new topics. When it comes to software development, I prioritize high-quality sources such as books, official documentation, and technical articles.\n\n'

      'I always strive for excellence, maintaining a strong commitment to the quality of the final product. I deeply value code readability and performance, which is why I chose Flutter as my preferred cross-platform framework.\n\n'

      'I am eager to contribute to application development and system integration projects where I can leverage my technical skills, bring value to the team, and grow professionally within the organization.',
    madeWithFlutter: 'Made with Flutter  🩵',
    language: 'Language',
    theme: 'Theme',
    download: 'Download',
    downloadCv: 'Download CV',
    coverLetter: 'Cover Letter',
    company: 'Company',
    summary: 'Summary',
    portfolio: 'Portfolio',
    verify: 'Verify',
    experienceTitle: 'Experience',
    sapIsLearningJourneyTitle: 'SAP Integration Suite Development and Certification',
    sapIsLearningJourneyInfo:
      'Completed the Developing with SAP Integration Suite Learning Journey and courses, focusing on enterprise integration fundamentals and hands-on exercises for the SAP Certified - Integration Developer certification.\n\n'

      'The resulting portfolio implements the following key techniques:\n'
      '▪ Advanced API Management security orchestration with Google Firebase JWT verification.\n'
      '▪ Advanced security orchestration with OAuth2, signed JWT and mTLS authentication.\n'
      '▪ Advanced scripting for iFlow routing, exception handling, and security artifact reading.\n'
      '▪ Advanced data mapping with context, queues, and node functions handling.\n'
      '▪ Integration with the Google Firebase Authentication service for end-user management.\n'
      '▪ Asynchronous communication via JMS Queues.\n'
      '▪ XSLT, XML, and JSON conversions and namespace mapping.\n'
      '▪ Dynamic consumption of SOAP services via request parameters and mappings.\n'
      '▪ SQL Server database connection.',
    sapIsProjectApimProxyDescription: 'Allow end-user applications to connect to Cloud Integration using a Firebase JWT token.',
    sapIsProjectApimProxyInfo:
      '${Strings.widgetPlaceholder}'

      'End-user applications must authenticate with backend systems using credentials that allow the backend to trust and identify the requesting user.\n\n'

      'This API Management Proxy applies the following policies to trust and identify an end-user authenticated via Google Cloud Firebase Authentication:'

      '${Strings.title('▪ ForbidResources')}'
      'This RaiseFault policy forbids access to administrative resources. In this scenario, the Google Firebase Auth Users operations cannot be called from an end-user application.'

      '${Strings.title('▪ GetFirebaseJwtClaims')}'
      'This KeyValueMapOperations policy reads the issuer and audience claims configured for the Firebase application.'

      '${Strings.title('▪ LookupGoogleApisJwksCache')}'
      'This LookupCache policy reads the Google APIs’ public keys previously fetched and cached.'

      '${Strings.title('▪ FetchGoogleApisJwks')}'
      'This ServiceCallout policy fetches the Google APIs’ public keys if there is no valid cache.'

      '${Strings.title('▪ ExtractGoogleApisJwksMaxAge')}'
      'This ExtractVariables policy extracts the max-age value from the Cache-Control header of the previous policy response. This value is used to determine the expiration time of the Google APIs\' public keys cache.'

      '${Strings.title('▪ PopulateGoogleApisJwksCache')}'
      'This PopulateCache policy populates a cache with the fetched Google APIs\' public keys.'

      '${Strings.title('▪ VerifyFirebaseJwt')}'
      'This VerifyJWT policy verifies the Firebase JWT token from the end-user application request. It validates the claims and signature against the Google APIs\' public keys.'

      '${Strings.title('▪ SetHeaders')}'
      'This AssignMessage policy adds the User-ID header with the end-user ID extracted from the Firebase JWT token and removes the Authorization header before forwarding the request to Cloud Integration.\n\n'

      'The resources are documented in the API Management following the OpenAPI specification:'
      '${Strings.widgetPlaceholder}',
    sapIsProjectIFlowProxyDescription: 'Validate incoming requests and manage iFlow routing.',
    sapIsProjectIFlowProxyInfo:
      '${Strings.widgetPlaceholder}'

      'This iFlow is the entry point for all iFlows of the project. It performs the following operations:\n'
      '▪ Request settings validation.\n'
      '▪ iFlow routing via ProcessDirect based on request path.\n'
      '▪ Logging Exceptions.\n'
      '▪ Cleaning sensitive headers.'

      '${Strings.title('Request Settings Validation')}'
      'For each route, the following settings are validated:\n'
      '▪ Allowed HTTP methods.\n'
      '▪ Supported paths.\n'
      '▪ Supported query parameters.'

      '${Strings.widgetPlaceholder}'

      'Requests that do not match any configured route return 404 (Not Found).\n'
      'Unsupported HTTP methods return 405 (Method Not Allowed).\n'
      'Incorrect query parameters return 400 (Bad Request).'

      '${Strings.title('Sensitive Headers Cleaning')}'
      'Some sensitive headers generated during iFlows processing, such as Authorization, custom headers using the _* naming pattern, auto-generated headers by DataStore steps, and others, are removed before returning to the Sender.'

      '${Strings.title('Exception Handling')}'
      'Exception handling involves routing runtime exceptions to the Exception Handler iFlow.\n\n'

      'The following script handles undeployed iFlow exceptions, proxy exceptions, and internal iFlow exceptions:'
      '${Strings.widgetPlaceholder}',
    sapIsProjectExceptionHandlerDescription: 'Log the message\'s data in the Message Processing Log and send alert emails.',
    sapIsProjectExceptionHandlerInfo:
      '${Strings.widgetPlaceholder}'

      'This iFlow is responsible for handling exceptions across the entire project.\n\n'

      'Logging, email alerts, and SMTP settings can be configured via externalized parameters.\n\n'

      'The following script, called by each iFlow, handles all the mapped exceptions. Unhandled exceptions are propagated to the Proxy iFlow, where this iFlow catches them:'
      '${Strings.widgetPlaceholder}'

      'Common exceptions related to incorrect payload formats, schema validation errors, and database conflicts are handled as user-side bad requests.\n'
      'HTTP and SOAP exceptions are handled or propagated depending on the response code.',
    sapIsProjectOAuth2TokensHandlerDescription: 'Generate, cache, and manage the expiration time of OAuth2 tokens.',
    sapIsProjectOAuth2TokensHandlerInfo:
      '${Strings.widgetPlaceholder}'

      'This iFlow handles OAuth2 tokens\' lifecycle for the following scenarios:\n'
      '▪ OAuth2 servers that require Client Credentials and mTLS as authentication for token generation.\n'
      '▪ Google APIs OAuth2 servers that require a signed JWT as authentication for token generation.'

      '${Strings.title('Client Credentials and mTLS')}'
      'During the development of this solution, the HTTP Receiver adapter did not allow configuring the OAuth2 Client Credentials and Client Certificate authentication methods simultaneously.\n'
      'The same limitation applies to the official SDK\'s built-in function for handling OAuth2 tokens\' lifecycle.\n'
      'This solution generates a request body from a deployed OAuth2 Client Credentials artifact and configures the HTTP Receiver adapter with the Client Certificate authentication method.'

      '${Strings.title('Google APIs OAuth2 with Signed JWT')}'
      'This solution generates a request body with the signed JWT using a deployed Google APIs Service Key that contains the private key.\n\n'

      'The following scripts are the core of the solution. They implement the tokens and security artifacts handling:'
      '${Strings.widgetPlaceholder}',
    sapIsProjectGoogleFirebaseAuthUsersDescription: 'Manage end-users in the Google Firebase Authentication service.',
    sapIsProjectGoogleFirebaseAuthUsersInfo:
      'This solution is intended to replicate users from the SAP system (e.g., Business Partners) to the Google Firebase Authentication service so they can sign in to end-user applications that implement the Firebase Authentication solution.\n\n'

      'It is composed of the following iFlows:'

      '${Strings.title('▪ Google Firebase Auth Users')}'
      '${Strings.widgetPlaceholder}'

      'This is the main iFlow which performs the actual integration. It supports the following operations:\n'
      '▪ POST / - creates a new user by providing its ID and email.\n'
      '▪ PATCH / - updates a user by providing its ID, email, and status (enabled/disabled).\n'
      '▪ DELETE /{userId} - deletes a user by providing its ID.'

      '${Strings.title('▪ Google Firebase Auth Users Async')}'
      '${Strings.widgetPlaceholder}'

      'This iFlow processes the main iFlow asynchronously by storing the request in a JMS queue and returning immediately to the Sender.\n'
      'The actual integration is processed later by another iFlow.'

      '${Strings.title('▪ Google Firebase Auth Users Async Queue')}'
      '${Strings.widgetPlaceholder}'

      'This iFlow processes the JMS queue of asynchronous requests, calls the main iFlow, and stores the response for later consumption.'

      '${Strings.title('▪ Google Firebase Auth Users Async Response')}'
      '${Strings.widgetPlaceholder}'

      'This iFlow returns all pending stored responses and clears them.',
    sapIsProjectInterStatementOauth2MtlsDescription: 'Get a bank statement by period from my Inter Bank enterprise account.',
    sapIsProjectInterStatementOauth2MtlsInfo:
      '${Strings.widgetPlaceholder}'

      'This iFlow implements an API integration that requires OAuth2 authorization and Mutual TLS handshake.\n\n'

      'The iFlow OAuth2 Tokens Handler sets the Authorization header.\n\n'

      'The mTLS handshake is configured in the HTTP Receiver adapter using the Client Certificate authentication method.\n\n'

      'The request has the following form:\n'
      'GET /?start-date={T_DATE}&end-date={T_DATE}.',
    sapIsProjectSqlServerWithXsltDescription: 'Connect to a SQL Server database via JDBC and perform basic operations.',
    sapIsProjectSqlServerWithXsltInfo:
      '${Strings.widgetPlaceholder}'

      'This iFlow uses XSLT to transform a JSON request into the XML format required by the JDBC adapter.\n\n'

      'The supported operations are:\n'
      '▪ POST /search - SELECT operation.\n'
      '▪ POST / - INSERT operation.\n'
      '▪ PATCH / - UPDATE operation.\n\n'

      'The XML validator schema and XSLT mapping are configured by the CamelHttpMethod and CamelHttpPath headers:'
      '${Strings.widgetPlaceholder}'

      'The following example demonstrates the implementation of the SELECT operation:'
      '${Strings.widgetPlaceholder}',
    sapIsProjectConversionsAndFtpDescription: 'Convert the payload from/to different formats and save the result to an FTP server.',
    sapIsProjectConversionsAndFtpInfo:
      '${Strings.widgetPlaceholder}'

      'This iFlow implements the most common conversions.\n'
      'The Content-Type header defines the source format.\n'
      'The Accept header defines the target format.\n\n'

      'The supported conversions are:\n'
      '▪ POST / - text/csv > application/xml.\n'
      '▪ POST / - application/json > application/xml.\n'
      '▪ POST / - application/xml > text/csv.\n'
      '▪ POST / - application/xml > application/json.\n\n'

      'The result is saved to an FTP server configured via externalized parameters.\n\n'

      'For demonstration purposes, the conversions between XML and JSON formats include namespace mappings:'

      '${Strings.title('▪ JSON to XML')}'
      '${Strings.widgetPlaceholder}'
      '${Strings.widgetPlaceholder}'

      '${Strings.title('▪ XML to JSON')}'
      '${Strings.widgetPlaceholder}'
      '${Strings.widgetPlaceholder}',
    sapIsProjectMappingsDescription: 'Map hierarchical and flat data trees.',
    sapIsProjectMappingsInfo:
      '${Strings.widgetPlaceholder}'

      'This iFlow applies context handling and functions to map the following scenarios:'

      '${Strings.title('▪ Hierarchical tree to flat tree:')}'
      '${Strings.widgetPlaceholder}'

      'The following example demonstrates the payload and the mapping result (not sorted):'
      '${Strings.widgetPlaceholder}'

      '${Strings.title('▪ Flat tree to hierarchical tree:')}'
      '${Strings.widgetPlaceholder}'

      'The following example demonstrates the payload and the mapping result (sorted):'
      '${Strings.widgetPlaceholder}',
    sapIsProjectCalculatorDescription: 'Consume the public webservice Calculator (http://www.dneonline.com/calculator.asmx).',
    sapIsProjectCalculatorInfo:
      '${Strings.widgetPlaceholder}'

      'This iFlow dynamically implements the four operations available at the public SOAP webservice Calculator.\n\n'

      'The supported operations are:\n'
      '▪ GET /?operation=Add&paramA={T_INT}&paramB={T_INT}.\n'
      '▪ GET /?operation=Subtract&paramA={T_INT}&paramB={T_INT}.\n'
      '▪ GET /?operation=Multiply&paramA={T_INT}&paramB={T_INT}.\n'
      '▪ GET /?operation=Divide&paramA={T_INT}&paramB={T_INT}.\n\n'

      'The operation parameter defines the SoapAction header and the mappings:'
      '${Strings.widgetPlaceholder}'

      'The paramA and paramB parameters are mapped to the SOAP request parameters:'
      '${Strings.widgetPlaceholder}',
    sapIsProjectsScriptCollectionInfo: '*The project\'s script collection is on my GitHub.',
    fortlevExperienceTitle: 'Flutter Mobile Application Development',
    fortlevExperienceInfo:
      'Developed the "Mão Dupla" freight order management app for Fortlev.\n'
      'Collaborated with managers and end-users as a Developer Analyst to gather and define functional and technical requirements.\n\n'

      'The app integrates with the SAP TM (Transportation Management) module to streamline operations between freight managers, carriers, and driver partners. The key features are:\n'
      '▪ User authentication.\n'
      '▪ Freight Orders and Invoices management.\n'
      '▪ Incident reporting during the journey.\n'
      '▪ Push Notifications for relevant events.\n'
      '▪ Offline-first support for disconnected operations.\n'
      '▪ Help/support features such as Contacts, Tips, and FAQ.',
    fortlevProjectMaoDuplaTitle: 'Mão Dupla mobile application',
    fortlevProjectMaoDuplaDescription: 'Streamline operations between freight managers, carriers, and driver partners.',
    smartNewExperienceTitle: 'Flutter Mobile/Web Application Development',
    smartNewExperienceInfo:
      'Provided consulting services for developing a mobile/web app prototype for SmartNew, a company specializing in fleet monitoring and management systems.\n\n'

      'The goal was to migrate away from their existing low-code stack.',
    mobileGameExperienceTitle: 'Casual Game Design and Development',
    mobileGameExperienceDetail: 'Self-Employed ▪ 2013 - 2020',
    mobileGameExperienceInfo:
      'Developed a personal 2D casual game project for mobile devices.\n\n'

      'During the conceptual phase, built small prototypes using the Android SDK and Java with native views.\n\n'

      'The first version of the engine was developed using Java/OpenGL ES 1.0. A second version was developed using OpenGL ES 2.0.\n\n'

      'Ported the code to C++ and experimented with Unity/C# to make the game cross-platform.',
    santriExperienceTitle: 'ERP Application Development',
    santriExperienceDetail: 'Santri Solutions ▪ 10/2007 - 04/2012',
    santriExperienceInfo:
      'Contributed to developing the ADM client-server application using Delphi (RAD Studio) and Oracle with PL/SQL at Santri.\n\n'

      'Analyzed, specified, and implemented customer requirements under the supervision of a Senior Systems Analyst.\n\n'

      'As the most experienced developer on the team, my responsibilities included introducing and assisting new members with the adopted development standards.\n\n'

      'Led a small team for a short period before leaving the company.',
    smallErpExperienceTitle: 'ERP Application Development',
    smallErpExperienceInfo:
      'Developed a small client-server application using Delphi (RAD Studio) and MySQL for a local building materials store.\n\n'

      'This project allowed me to apply the knowledge I was gaining during my degree and independent study of the Mastering Delphi book.',
    educationTitle: 'Education',
    educationUniversityTitle: 'Computer Networks',
    educationUniversityDetail: 'Estácio de Sá University ▪ 2006 - 2008',
    educationUniversityInfo:
      'The course covered the theoretical and practical fundamentals of computer network architecture.\n\n'

      'It also included: Digital Systems, Operating Systems, Data Structure & Algorithms, and an introduction to programming languages such as C and Java.',
    professionalDevelopmentTitle: 'Professional Development',
    certificationsTitle: 'Certifications',
    coursesTitle: 'Courses',
    booksTitle: 'Books',
    bookDelphiBibleTitle: 'Mastering Delphi - The Bible',
    bookGoogleAndroidTitle: 'Google Android - Mobile Applications with the Android SDK',
    courseOracleTitle: 'Oracle OCA/OCP Certification Exams Guide',
    courseSapCloudIntegrationImmersionTitle: 'SAP Cloud Integration Immersion',
    languagesTitle: 'Languages',
    languagesInfo: {
      'Portuguese': ['Native'],
      'English': ['Advanced reading', 'Intermediate writing', 'Intermediate technical conversation']
    },
    availabilityTitle: 'Availability',
    availabilityInfo: {
      'Independent contractor (PREFERRED)': ['Fixed-term', 'Hourly rate'],
      'Employee contract': null,
      'Remote only': null,
      'Freelance': null
    },
    visitOnlineResume: '*Visit my online resume to check out my relevant practical projects:'
  );

  @override
  List<String> coverLetterSapIsInfo(String companyName) => [
    'Dear ${companyName} recruiting team,',

    'I would like to express my interest in opportunities for the SAP Integration Suite Developer role. With a strong background in developing large-scale enterprise software (ERP) and mobile applications, I have focused my senior technical expertise on architecting and implementing robust, secure enterprise integration flows.\n\n'

    'I solidified this specialization by completing SAP’s Developing with SAP Integration Suite learning journey, backed by my official SAP Integration Developer (C_CPI) certification and proven credentials in API Management, Cloud Integration, and Event Mesh. I have hands-on experience implementing core integration techniques, including advanced security orchestration (such as mTLS, OAuth2, and Google Firebase Authentication JWT validation), custom scripting, complex data mapping, XSLT/XML/JSON transformations, and asynchronous event-driven communication.\n\n'

    'I put this combination of senior development experience and SAP ecosystem knowledge into practice while working as a Developer Analyst for Fortlev. There, I helped automate logistics processes by building a mobile application integrated with the SAP TM (Transportation Management) module. Beyond my core technical skills, I bring strong business analysis and requirements specification experience, a collaborative approach to working with multiple stakeholders, and a background in leading and mentoring tech teams.\n\n'

    'I am excited about the opportunity to bring value to your clients through my software development and systems integration skills. Thank you for your time and consideration, and I look forward to the opportunity to discuss my qualifications in a technical interview.\n\n'

    'Sincerely,',

    '${Strings.personalName}.'
  ];
}