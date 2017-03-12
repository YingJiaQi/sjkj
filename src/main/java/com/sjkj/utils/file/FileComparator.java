package com.sjkj.utils.file;

import java.io.File;
import java.util.Comparator;

public class FileComparator implements Comparator<File> {

	public int compare(File file1, File file2) {
		return file1.getName().compareTo(file2.getName());
	}

}