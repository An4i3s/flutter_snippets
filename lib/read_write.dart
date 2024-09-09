import 'dart:io'; 

import 'package:path_provider/path_provider.dart'; 

class ReadWrite { 
Future<String> get _directoryPath async { 
	Directory? directory = await getApplicationDocumentsDirectory(); 
	return directory.path; 
} 

Future<File> getFile(String fileNameWithExtension) async { 
	final path = await _directoryPath; 
	return File("$path/$fileNameWithExtension"); 
} 

writeTextFile(String fileNameWithExtension, String content) async { 
	File file = await getFile(fileNameWithExtension); 
  file.writeAsStringSync('$content\n', mode:  FileMode.append);
} 

readTextFile(String fileNameWithExtension) async { 
	final file = await getFile(fileNameWithExtension); 
	final fileContent = await file.readAsString(); 
	return fileContent; 
} 
}