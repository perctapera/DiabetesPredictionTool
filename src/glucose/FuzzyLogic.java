package glucose;
import java.util.*;   

   
public class FuzzyLogic {   
   
  /**  
   * A list of all fuzzy logic sets that are associated with  
   * this class.  
   */   
  protected ArrayList list = new ArrayList();   
  /**  
   * Add a fuzzy set to this fuzzy logic processor.  
   *  
   * @param set The fuzzy logic set to be added.  
   */   
   
  public void add(FuzzySet set)   
  {   
    list.add(set);   
  }   
   
  /**  
   * Clear all fuzzy logic sets from this processor.  
   */   
  public void clear()   
  {   
    list.clear();   
  }   
   
  
  public double []evaluate(double in)   
  {   
    double result[] = new double[list.size()];   
    Iterator itr = list.iterator();   
    int i = 0;   
    while (itr.hasNext()) {   
      FuzzySet set = (FuzzySet)itr.next();   
      result[i++] = set.evaluate(in);   
    }   
    return result;   
  }   
   
   
}  
