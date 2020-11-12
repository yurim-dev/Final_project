package org.final_proj.service;

import java.util.HashSet;
import java.util.StringTokenizer;

import org.final_proj.domain.GoodsVO;
import org.final_proj.domain.SearchDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class RecommendServiceTests {
	@Setter(onMethod_ = @Autowired)
	private RecommendService service;

	@Test
	public void getIngreServiceTest () {
		SearchDTO search = new SearchDTO();
		HashSet<GoodsVO> gSet = new HashSet<GoodsVO> ();
		String str = "#백종원 #마약옥수수 #옥수수간식\n여름 간식으로"+
				" 맛있게 먹을 수 있는 마약 옥수수 만드는 방법 알려드릴게요!\n마요네즈와"+
				" 설탕, 고추가루를 넣어 만든 소스로 중독되는 '마약 옥수수' 한번 만들어 "+
				"보세요\n\n=======================\n\n마약옥수수\n\n[재료]\n\n삶은" +
				" 옥수수 2개\n마요네즈 5큰술(80g)\n황설탕 2큰술(24g)\n파마산 치즈가루"+
				" 적당량\n고운 고춧가루 적당량\n\n[만드는 법]\n\n1. 식은 옥수수는"+
				" 전자레인지에 30초~1분 정도 돌려 따뜻하게 준비한다.\n   (낱알 옥수수는"+
				" 떼어서 전자레인지에 돌려 준비한다.)\n2. 옥수수는 칼을 이용하여 반으로"+
				" 잘라 심지 부분에 나무젓가락을 꽂는다.\n3. 프라이팬을 약 불에 올린 후"+
				" 마요네즈, 황설탕을 넣고 저어가며 설탕을 녹여 마요네즈소스를 만든다.\n4. "+
				"준비해 둔 옥수수에 주걱을 이용하여 마요네즈소스를 골고루 묻힌다.\n "+
				"(낱알 옥수수는 소스에 넣고 버무린다.)\n5. 소스가 묻은 옥수수에 파마산치즈가루를 "+
				"뿌려 그릇에 담는다. \n6. 고운고춧가루를 골고루 뿌려 완성한다.\n  "+
				"(아이들이 먹을 경우 고춧가루를 뿌리지 않는다.)\n\n\nMayak oksusu " +
				"(addictive corns)\n\n[Ingredients]\n\n2 boiled corns "+
				"on the cob\n5 tbsp (80g) mayonnaise\n2 tbsp (24g) brown sugar\nParmesan "+
				"cheese flakes\nFine red pepper powder\n\n[Directions]\n\n1. Microwave"+
				" corns for 30 seconds to 1 minute to warm them up.\n   (Microwave the corn"+
				" kernels on a plate.)\n2. Cut the corn cob in half with a knife and insert a wooden"+
				" chopstick in the center.\n3. Put a pan over low heat and mix mayonnaise "+
				"and brown sugar to make the sauce.\n4. Brush the sauce on the corns using a spatula.\n  "+
				"(Mix the sauce with corn kernels.)\n5. Sprinkle some Parmesan cheese flakes on "+
				"top and plate up. \n6. Sprinkle red pepper powder to finish.\n   (Skip red pepper powder"+
				" if you're making it for kids.)\n\n\n한식을 사랑하는 외국인분들을 위해 외국어 자막을"+
				" 첨부하였습니다.\n본 영상의 자막은 통합 언어 플랫폼 ‘플리토’와 함께 합니다.\nSubtitles"+
				" in foreign languages are provided for everyone who loves Korean food.\nAll subtitles"+
				" are provided by an integrated language"+
				" platform, Flitto.\nhttps://www.flitto.com/business/video-translation";
		StringTokenizer token = new StringTokenizer(str, "\n \'\"");

		while(token.hasMoreTokens()) {
			String tmpToken = token.nextToken();
			log.info(tmpToken);
			search.setQuery(tmpToken);
			gSet.addAll(service.getIngredient(search));
		}
		
		log.info("★★추천 결과★★\n"+gSet);
	}
	
	@Test
	public void getMealkitServiceTest () {
		SearchDTO search = new SearchDTO();
		HashSet<GoodsVO> gSet = new HashSet<GoodsVO> ();
		String str = "'소고기' 말고 '돼지고기'로 끓이는 '뭇국', 엄청 시원하고 개운해요\",\r\n" + 
				"                \"description\": \"#백종원 #소고기뭇국아니고 #돼지고기뭇국\\n더운 여름"
				+ " 시원~한 돼지고기 뭇국 드세요!\\n소고기 뭇국 못지 않게 돼지고기 뭇국도 정말 맛있습니다.\\n뜨거운"
				+ " 무 조심해서 드세요 이빨 빠집니다\\n\\n===========================\\n\\n돼지고기 "
				+ "뭇국\\n\\n[재료]\\n\\n식용유 약3큰술(23g)\\n돼지고기 후지 200g\\n진간장 4큰술(40g)\\n정수물"
				+ " 10컵(1800ml)\\n무 약1/4개(575g)\\n간 생강 1/10큰술(2g)\\n맛소금 약1/3큰술(5g)\\n대파"
				+ " 약 1컵(60g)\\n후춧가루 약간\\n\\n[만드는 법]\\n\\n1. 무는 길게 4등분 하여 두께 1cm 정도로 "
				+ "썬다.\\n2. 대파는 송송 썬다. \\n3. 돼지고기는 가로, 세로 2.5cm 정도로 큼직하게 썬다.\\n4. "
				+ "냄비에 식용유를 두르고 썰어놓은 돼지고기를 넣고 볶는다.\\n5. 고기가 하얗게 익으면 진간장을 "
				+ "넣고 졸이듯이 볶는다.\\n6. 간장이 졸아들면 정수물, 무, 간 생강, 대파를 넣고 약 30분간 중 불에"
				+ " 끓인다.\\n7. 맛소금을 이용하여 간을 맞춘 후 불을 끈다.\\n8. 그릇에 담은 후 후춧가루를 뿌려 "
				+ "완성한다.\\n\\n\\nDwaejigogi mutguk (Pork and radish soup)\\n\\n[Ingredients]\\n\\n3 tbsp (23g)"
				+ " cooking oil\\n200g pork leg\\n4 tbsp (40g) dark soy sauce\\n10 cups (1800ml) drinking water\\n1/4"
				+ " (575g) radish\\n1/10 tbsp (2g) minced ginger\\n1/3 tbsp (5g) seasoned salt\\n1 cup (60g) green"
				+ " onion\\nBlack pepper\\n\\n[Directions]\\n\\n1. Cut the radish into quarters, cutting each piece"
				+ " at a thickness of 1cm.\\n2. Finely chop the green onion.\\n3. Cut the pork into big pieces, about"
				+ " 2.5cm both vertically and horizontally.\\n4. Coat the pan with cooking oil and stir-fry the "
				+ "pork.\\n5. When the meat turns white, add dark soy sauce and stir-fry as if you were simmering "
				+ "it.\\n6. Once the soy sauce is simmered down, add water, radish, minced ginger, and green onions."
				+ " Boil over medium heat for about 30 minutes.\\n7. Season with salt and remove from heat.\\n8."
				+ " Pour it into a bowl and finish by sprinkling some black pepper.\\n\\n\\n한식을 사랑하는"
				+ " 외국인분들을 위해 외국어 자막을 첨부하였습니다.\\n본 영상의 자막은 통합 언어 플랫폼"
				+ " ‘플리토’와 함께 합니다.\\nSubtitles in foreign languages are provided for everyone who "
				+ "loves Korean food.\\nAll subtitles are provided by an integrated language platform, "
				+ "Flitto.\\nhttps://www.flitto.com/business/video-translation";
		StringTokenizer token = new StringTokenizer(str, "\n \'\"");

		while(token.hasMoreTokens()) {
			String tmpToken = token.nextToken();
			log.info(tmpToken);
			search.setQuery(tmpToken);
			gSet.addAll(service.getMealKit(search));
		}
		
		log.info("★★추천 결과★★\n"+gSet);
	}
	
	
}
