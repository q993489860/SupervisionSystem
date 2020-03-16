package date;

import com.chtc.util.DateUtil;
import org.junit.Test;

import java.text.ParseException;
import java.util.Date;

public class DateNextMinute {
    public static final String COMMON_DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
    @Test
    public void getNextMinute(){
       Date date =  DateUtil.getDateNextMinute(2);
        try {
            System.out.println(DateUtil.formatDate2String(date,COMMON_DATE_TIME_FORMAT));
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }
}
