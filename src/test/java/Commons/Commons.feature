@ignore
Feature: common functions

  Scenario:
# ************ Length based customized random string  *************************
    * def randomString =
      """
      function(s)
      {
          var text = "";
          var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
          for(var i=0;i<s;i++)
          text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
          return text;
        }
    """
    * def randomText = randomString(10)
    * print randomText

# ***************** End of length based random string *******************
