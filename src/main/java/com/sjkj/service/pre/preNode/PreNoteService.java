package com.sjkj.service.pre.preNode;

import java.util.Map;

import org.springframework.util.MultiValueMap;

public interface PreNoteService {
/**
 * @param userCode 
 * @param note_title 
 * @param cate_name 
 * @param newFileAddr 
 * @DESC	保存记录、笔记 
 * @param nodeContent 笔记内容
 * @param newFileAddr 文件新路径
 * @return
 */
Map<String, String> addNoteContent(String _newNoteContent, String userCode, String cate_name, String note_title, String newFileAddr);
/**
 * 获取该用户保存的所有笔记。记录 内容
 * @param currPage  当前页
 * @param pageSize  每页大小
 * @return
 */
Map<String, Object> getNoteContentList(String pageSize, String currPage);
/**
 * 获取笔记类目list集合
 * @return
 */
Map<String, Object> getUserNoteCategory();

}
