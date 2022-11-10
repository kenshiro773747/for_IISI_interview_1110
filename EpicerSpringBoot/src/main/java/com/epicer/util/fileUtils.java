package com.epicer.util;



import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class fileUtils {
	
	public static boolean upload(MultipartFile file, String path, String fileName) {

		// 使用原文件名
		String realPath = path + fileName;
		File dest = new File(realPath);
		try {
			// 保存文件
			file.transferTo(dest);
			return true;
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}

	}
}
