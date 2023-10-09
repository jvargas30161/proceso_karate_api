package src;

import java.util.List;
import java.util.Map;

public class PetsCounter {

  public static int countPetsWithSameName(String name,
                                          List<Map<String, Object>> pets) {
    int count = 0;
    for (Map<String, Object> pet : pets) {
      String petName = (String) pet.get("name");
      if (petName != null && petName.equals(name)) {
        count++;
      }
    }
    return count;
  }
}