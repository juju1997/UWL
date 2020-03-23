package com.uwl.web.post;

import java.io.File;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.post.PostService;

@RestController
@RequestMapping("/post/*")
public class PostRestController {

	@Autowired
	private PostService postService;
	
	public PostRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="/rest/addSummerNoteFile", method=RequestMethod.POST)
	public String addSummerNoteFile(MultipartFile file) throws Exception{
		System.out.println("addSummerNoteFile.POST");
//		String path = "C:\\Users\\User\\git\\UWL\\uwl\\WebContent\\resources\\images\\";
		String path = "C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\uwl\\resources\\images";
		String name = "";
		name = UUID.randomUUID() + file.getOriginalFilename();
		file.transferTo(new File(path, name));
		return name;
	}
	
	@RequestMapping(value="/rest/listBoard", method=RequestMethod.POST)
	public Map<String, Object> listBaord(@RequestBody Search search) throws Exception{
		System.out.println("/rest/listBoard.POST");
		search.setPageSize(pageSize);
		String gatherCategoryNo = "";
		Map<String, Object> map = postService.getBoardList(search, gatherCategoryNo);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		map.put("resultPage", resultPage);
		
		return map;
	}
}
