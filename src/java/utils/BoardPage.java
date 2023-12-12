package utils;

public class BoardPage {

	public static String pagingStr(int totalCount,int pageSize,int blockPage,
			int pageNum,String reqUrl) {

		String pagingStr ="";


		//전체페이지 수 계산

		int totalPages = (int)(Math.ceil((double)totalCount/pageSize));

		//이전 페이지 블럭 바로가기 출력 

		int pageTemp = (((pageNum - 1) /blockPage) * blockPage) +1;

		if(pageTemp != 1) { 
			pagingStr += "<a href = '" +reqUrl +"?pageNum = 1'>[첫페이지]</a>";
			pagingStr += "&nbsp;"; //공백
			pagingStr += "<a href = '" +reqUrl + "?pageNum = "+(pageTemp -1)+"'>[이전블럭]</a>";

		}

		//각 페이지번호 출력
		int blockCount = 1;
		while(blockCount <= blockPage && pageTemp <=totalPages) {

			if(pageTemp ==pageNum) {
				//현재 내가 있는 페이지 != 링크
				pagingStr +="&nbsp;" +pageTemp +"&nbsp;";  // 양옆에 공백을 둠으로 구분
			}else {// 현재페이지 아니면 링크가 있음
				pagingStr +="&nbsp; <a href='"+reqUrl+"?pageNum="+pageTemp +"'>"+pageTemp+"</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;		
		}
		// 다음 페이지 블럭 바로가기
		if(pageTemp <=totalPages) {
			pagingStr += "<a href='"+reqUrl+"?pageNum="+pageTemp+
					"'>[다음블럭]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='"+reqUrl+"?pageNum="+totalPages +"'>[마지막페이지]</a>";  // 전체페이지 수가 마지막 페이지가 됨..?


		}

		return pagingStr;
	}
}