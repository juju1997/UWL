package com.uwl.service.matching.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.uwl.common.Search;
import com.uwl.service.domain.Item;
import com.uwl.service.domain.Matching;
import com.uwl.service.domain.User;
import com.uwl.service.matching.MatchingService;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration(locations = { "classpath:config/context-common.xml", "classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml", "classpath:config/context-transaction.xml" })

public class MatchingServiceTest {

	@Autowired
	@Qualifier("matchingServiceImpl")
	private MatchingService matchingService;

	// @Test
	public void testAddMatching() throws Exception {
		Matching matching = new Matching();

		matching.setFirstUserId("user01");
		matching.setSecondUserId("user02");

		matchingService.addMatching(matching);
	}

	// @Test
	public void testGetMatching() throws Exception {
		Matching matching = new Matching();

		matching = matchingService.getMatching("user01");

		Assert.assertEquals(10000, matching.getMatchingNo());
		Assert.assertEquals("user01", matching.getFirstUserId());
		Assert.assertEquals("user02", matching.getSecondUserId());
		Assert.assertEquals("2020-02-05", matching.getSendDate().toString());
		Assert.assertEquals("1", matching.getMatchingStatus());

		Assert.assertNotNull(matchingService.getMatching("user01"));
	}

	// @Test
	public void testUpdateMatching() throws Exception {
		Matching matching = matchingService.getMatching("user01");
		Assert.assertNotNull(matching);

		Assert.assertEquals(10000, matching.getMatchingNo());
		Assert.assertEquals("user01", matching.getFirstUserId());
		Assert.assertEquals("user02", matching.getSecondUserId());
		Assert.assertEquals("2020-02-05", matching.getSendDate().toString());
		Assert.assertEquals("1", matching.getMatchingStatus());

		matching.setMatchingStatus("2");

		matchingService.updateMatching(matching);
	}

	// @Test
	public void testDeleteMatching() throws Exception {
		Matching matching = matchingService.getMatching("user01");
		Assert.assertNotNull(matching);

		Assert.assertEquals(10000, matching.getMatchingNo());
		Assert.assertEquals("user01", matching.getFirstUserId());
		Assert.assertEquals("user02", matching.getSecondUserId());
		Assert.assertEquals("2020-02-05", matching.getSendDate().toString());
		Assert.assertEquals("2", matching.getMatchingStatus());

		matching.setMatchingStatus("4");

		matchingService.deleteMatching(matching);
	}

	// @Test
	public void testGetMatchingList() throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		String userId = "user02";
		System.out.println("userId : " + userId);
		Map<String, Object> map = matchingService.getMatchingList(search, userId);
		System.out.println("map : " + map);

		List<Object> list = (List<Object>) map.get("list");
		Assert.assertEquals(1, list.size());
		System.out.println("list : " + list);

		Integer totalMatching = (Integer) map.get("totalMatching");
		System.out.println("totalMatching : " + totalMatching);
	}

	// @Test
	public void testGetAllMatchingList() throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		Map<String, Object> map = matchingService.getAllMatchingList(search);
		System.out.println("map : " + map);

		List<Object> list = (List<Object>) map.get("list");
		Assert.assertEquals(2, list.size());
		System.out.println("list : " + list);

		Integer totalMatchingCount = (Integer) map.get("totalMatchingCount");
		System.out.println("totalMatchingCount : " + totalMatchingCount);
	}

	// @Test
	public void testGetTotalMatching() throws Exception {
		Search search = new Search();

		search.setCurrentPage(1);
		search.setPageSize(3);

		String userId = "user02";

		int totalMatching = matchingService.getTotalMatching(search, userId);
		System.out.println("totalMatching : " + totalMatching);
	}

	@Test
	public void testAddItem() throws Exception {
		
		
		Item item = new Item();
		
		
		
		
		item.setFirstUserId("user01");
		item.setItemCategory("1");
		item.setItemDefault("2");
		
		matchingService.addItem(item);
	}

	// @Test
	public void testGetItem() throws Exception {
		Item item = new Item();

		item = matchingService.getItem("user01", "1");

		Assert.assertEquals(10000, item.getItemNo());
		Assert.assertEquals("user01", item.getFirstUserId());
		Assert.assertEquals(null, item.getSecondUserId());
		Assert.assertEquals("1", item.getItemCategory());
		Assert.assertEquals(null, item.getUseResult());
		Assert.assertEquals("1", item.getItemDefault());
		Assert.assertEquals(null, item.getUseDate());

		Assert.assertNotNull(matchingService.getItem("user01", "1"));

	}

	// @Test
	public void testUpdateItem() throws Exception {
		Item item = matchingService.getItem("user01", "1");
		Assert.assertNotNull(item);

		item.setSecondUserId("user02");
		item.setUseResult("1");

		matchingService.updateItem(item);
	}

	// @Test
	public void testGetItemList() throws Exception {
		Search search = new Search();

		search.setCurrentPage(1);
		search.setPageSize(3);

		String userId = "user01";
		System.out.println("userId : " + userId);

		String itemCategory = "1";
		System.out.println("itemCategory : " + itemCategory);

		Map<String, Object> map = matchingService.getItemList(search, userId, itemCategory);
		System.out.println("map : " + map);

		List<Object> list = (List<Object>) map.get("list");
		Assert.assertEquals(0, list.size());
		System.out.println("list : " + list);

		Integer totalItem = (Integer) map.get("totalItem");
		System.out.println("totalItem : " + totalItem);

		itemCategory = "2";
		System.out.println("itemCategory : " + itemCategory);

		Map<String, Object> map2 = matchingService.getItemList(search, userId, itemCategory);
		System.out.println("map2 : " + map2);

		List<Object> list2 = (List<Object>) map2.get("list");
		Assert.assertEquals(1, list2.size());
		System.out.println("list2 : " + list2);

		Integer totalItem2 = (Integer) map2.get("totalItem");
		System.out.println("totalItem2 : " + totalItem2);
	}

	// @Test
	public void testGetAllItemList() throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		Map<String, Object> map = matchingService.getAllItemList(search);
		System.out.println("map : " + map);

		List<Object> list = (List<Object>) map.get("list");
		Assert.assertEquals(3, list.size());

		Integer totalItemCount = (Integer) map.get("totalItemCount");
		System.out.println("totalItemCount : " + totalItemCount);
	}

	//@Test
	public void testGetTotalItem() throws Exception {
		Search search = new Search();

		search.setCurrentPage(1);
		search.setPageSize(3);

		String userId = "user01";

		String itemCategory = "1";

		int totalItem = matchingService.getTotalItem(search, userId, itemCategory);
		System.out.println("totalItem : " + totalItem);

		itemCategory = "2";

		totalItem = matchingService.getTotalItem(search, userId, itemCategory);
		System.out.println("totalItem : " + totalItem);
	}

}
