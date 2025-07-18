package com.edu.springboot.utils;

public class PagingUtil {

    public static String pagingImg(
            int totalRecordCount,
            int pageSize,
            int blockPage,
            int pageNum,
            String pageBaseUrl) {

        StringBuilder pagingStr = new StringBuilder();

        int totalPage = (int)Math.ceil((double)totalRecordCount / pageSize);
        int intTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
        int blockCount = 1;

        if (intTemp != 1) {
            pagingStr.append("<a href='").append(pageBaseUrl).append("pageNum=1'>[처음]</a>&nbsp;");
            pagingStr.append("<a href='").append(pageBaseUrl)
                     .append("pageNum=").append(intTemp - blockPage)
                     .append("'>[이전]</a>&nbsp;");
        }

        while (blockCount <= blockPage && intTemp <= totalPage) {
            if (intTemp == pageNum) {
                pagingStr.append("&nbsp;<b>").append(intTemp).append("</b>&nbsp;");
            } else {
                pagingStr.append("&nbsp;<a href='").append(pageBaseUrl)
                         .append("pageNum=").append(intTemp).append("'>")
                         .append(intTemp).append("</a>&nbsp;");
            }
            intTemp++;
            blockCount++;
        }

        if (intTemp <= totalPage) {
            pagingStr.append("<a href='").append(pageBaseUrl)
                     .append("pageNum=").append(intTemp).append("'>[다음]</a>&nbsp;");
            pagingStr.append("<a href='").append(pageBaseUrl)
                     .append("pageNum=").append(totalPage).append("'>[끝]</a>");
        }

        return pagingStr.toString();
    }
}


