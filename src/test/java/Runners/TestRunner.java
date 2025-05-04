package Runners;

import com.intuit.karate.junit5.Karate;

class TestRunner {

    //Run all the APIs in one shot
    @Karate.Test
    Karate runTests() {
        return Karate.run("classpath:Features/Module1/test2").relativeTo(getClass());
    }

    //Run a specific API
//    @Karate.Test
//    Karate runSingleAPI()
//    {
//        return Karate.run("GetRequest").relativeTo(getClass());
//    }

//     Run specific tags
//     @Karate.Test
//     Karate runTags()
//     {
//         return Karate.run().tags("@test").relativeTo(getClass());
//     }


}
