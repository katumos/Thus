@ECHO OFF
rem %~dp0 is the expanded pathname of the current script under NT
set LOCAL_FOP_HOME=c:\Progra~1\Altova\FOP\
rem if "%OS%"=="Windows_NT" set LOCAL_FOP_HOME=%~dp0

set LIBDIR=%LOCAL_FOP_HOME%lib
set LOCALCLASSPATH=%LOCAL_FOP_HOME%build\fop.jar
set LOCALCLASSPATH=%LOCALCLASSPATH%;%LIBDIR%\xml-apis.jar
set LOCALCLASSPATH=%LOCALCLASSPATH%;%LIBDIR%\xercesImpl-2.2.1.jar
set LOCALCLASSPATH=%LOCALCLASSPATH%;%LIBDIR%\xalan-2.4.1.jar
set LOCALCLASSPATH=%LOCALCLASSPATH%;%LIBDIR%\batik.jar
set LOCALCLASSPATH=%LOCALCLASSPATH%;%LIBDIR%\avalon-framework-cvs-20020806.jar
set LOCALCLASSPATH=%LOCALCLASSPATH%;%LIBDIR%\jimi-1.0.jar
set LOCALCLASSPATH=%LOCALCLASSPATH%;%LIBDIR%\jai_core.jar
set LOCALCLASSPATH=%LOCALCLASSPATH%;%LIBDIR%\jai_codec.jar

java -Xms256m -Xmx256m -version:1.4.2_10 -cp "%LOCALCLASSPATH%" org.apache.fop.fonts.apps.PFMReader %1 %2 %3 %4 %5 %6


