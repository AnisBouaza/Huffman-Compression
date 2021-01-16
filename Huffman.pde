import java.util.*;
String code_temp = "";
Vector<Node> codage = new Vector();

class Node implements Comparable<Node>
{
  char a;
  int occ;
  Node fg;
  Node fd;
  String code;
///  
    Node()
    {
     this.a=' ';
     this.occ=0;
     this.fg=null;
     this.fd = null;
     this.code="";
    
    
    }
  
  
  Node(char a, int occ, Node fg, Node fd, String code)
    {
     this.a=a;
     this.occ=occ;
     this.fg=fg;
     this.fd = fd;
     this.code=code;
    
    
    }
  
  
     @Override
    public int compareTo(Node other) {
        return this.occ - other.occ;
    }
}


void ParcourCode(Node N)
{

   if (N != null)
   {
     if(N.a != ' ') 
     {
       //println(N.a+"->"+N.code);
       codage.add(N);
     }
 
     if(N.fg != null) 
     {
       N.fg.code = N.code+"1";
       ParcourCode(N.fg);
       
     }
   
     if(N.fd != null)
     {
       N.fd.code = N.code + "0";
       ParcourCode(N.fd);
     }
   }
  
}


void setup()
{

//String text = "abccaazertyuiopdmlkjhgfsqwxcvbnzzzzaabbuopuuiosslmfxcccccezaccccp";
String text = "loremipsumdolorsitametconsecteturadipiscingelitw";
Vector<Node> tab = new Vector();

for(int j=0;j<=25; j++)
{
  Node N = new Node();
  tab.add(N);
  
}

tab.get(0).a = 'a';
tab.get(1).a = 'b';
tab.get(2).a = 'c';
tab.get(3).a = 'd';
tab.get(4).a = 'e';
tab.get(5).a = 'f';
tab.get(6).a = 'g';
tab.get(7).a = 'h';
tab.get(8).a = 'i';
tab.get(9).a = 'j';
tab.get(10).a = 'k';
tab.get(11).a = 'l';
tab.get(12).a = 'm';
tab.get(13).a = 'n';
tab.get(14).a = 'o';
tab.get(15).a = 'p';
tab.get(16).a = 'q';
tab.get(17).a = 'r';
tab.get(18).a = 's';
tab.get(19).a = 't';
tab.get(20).a = 'u';
tab.get(21).a = 'v';
tab.get(22).a = 'w';
tab.get(23).a = 'x';
tab.get(24).a = 'y';
tab.get(25).a = 'z';


for(int i=0; i< text.length(); i++)
{
  char c = text.charAt(i);
  switch(c)
  {
    case 'a' : tab.get(0).occ = tab.get(0).occ+1;  break;
    case 'b' : tab.get(1).occ = tab.get(1).occ+1;   break;
    case 'c' : tab.get(2).occ = tab.get(2).occ+1;   break;
    case 'd' : tab.get(3).occ = tab.get(3).occ+1;   break;
    case 'e' : tab.get(4).occ = tab.get(4).occ+1;  break;
    case 'f' : tab.get(5).occ = tab.get(5).occ+1;   break;
    case 'g' : tab.get(6).occ = tab.get(6).occ+1;   break;
    case 'h' : tab.get(7).occ = tab.get(7).occ+1;   break;
    case 'i' : tab.get(8).occ = tab.get(8).occ+1;   break;
    case 'j' : tab.get(9).occ = tab.get(9).occ+1;   break;
    case 'k' : tab.get(10).occ = tab.get(10).occ+1;  break;
    case 'l' : tab.get(11).occ = tab.get(11).occ+1;   break;
    case 'm' : tab.get(12).occ = tab.get(12).occ+1;   break;
    case 'n' : tab.get(13).occ = tab.get(13).occ+1;   break;
    case 'o' : tab.get(14).occ = tab.get(14).occ+1;   break;
    case 'p' : tab.get(15).occ = tab.get(15).occ+1;   break;
    case 'q' : tab.get(16).occ = tab.get(16).occ+1;   break;
    case 'r' : tab.get(17).occ = tab.get(17).occ+1;   break;
    case 's' : tab.get(18).occ = tab.get(18).occ+1;   break;
    case 't' : tab.get(19).occ = tab.get(19).occ+1;   break;
    case 'u' : tab.get(20).occ = tab.get(20).occ+1;   break;
    case 'v' : tab.get(21).occ = tab.get(21).occ+1;   break;
    case 'w' : tab.get(22).occ = tab.get(22).occ+1;   break;
    case 'x' : tab.get(23).occ = tab.get(23).occ+1;   break;
    case 'y' : tab.get(24).occ = tab.get(24).occ+1;   break;
    case 'z' : tab.get(25).occ = tab.get(25).occ+1;   break;
  }
  
}

  for(int i=0; i<=tab.size()-1; i++)
  {
    print(tab.get(i).occ+"  ");
  }
  println();
Collections.sort(tab);
boolean v = false;
while(!v)
{
 if(tab.get(0).occ == 0) tab.remove(0);
 else v = true;
  
}

int size = tab.size()-1;
///// création de l'arbre
while(size > 0)
{
  Collections.sort(tab);
  for(int i=0; i<=tab.size()-1; i++)
  {
    print(tab.get(i).occ+"  ");
  }
  Node new_node = new Node();
  new_node.occ = tab.get(0).occ + tab.get(1).occ;
  new_node.fg = tab.get(0); new_node.fd = tab.get(1);
  Vector<Node> tab_new = new Vector();
  tab_new.add(new_node);
  for(int i=2; i<=tab.size()-1; i++)
    {
      tab_new.add(tab.get(i)); 
    }
    
  tab = tab_new;
  size --;
  println();
  
}

println(tab.get(0).occ);

//codage
Node N1 = tab.get(0);
ParcourCode(N1);

Collections.sort(codage);
for(int i=0; i<=codage.size()-1; i++)
{
  println(codage.get(i).a+" -> " + codage.get(i).code);
}

}
