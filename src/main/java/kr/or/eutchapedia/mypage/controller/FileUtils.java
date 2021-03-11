package kr.or.eutchapedia.mypage.controller;

import java.io.IOException;
import java.util.UUID;

public class FileUtils {

	public String uploadFileRename(String originalName ) throws IOException {
		UUID uuid = UUID.randomUUID();
		
		String savedName = uuid.toString()+"_"+originalName;
		
		return savedName;
	}
}	







