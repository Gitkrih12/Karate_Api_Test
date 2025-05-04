package Commons;

import org.apache.commons.lang3.RandomStringUtils;

public class JavaUtils {

    public String randomString(int length)
    {
        String generatedString = RandomStringUtils.randomAlphabetic(length);
        return generatedString;
    }

}
