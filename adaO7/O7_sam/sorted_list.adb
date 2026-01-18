with Ada.Integer_Text_Io;   use Ada.Integer_Text_Io;
with Ada.Text_Io;           use Ada.Text_Io;
with Ada.Unchecked_Deallocation; 

package body Sorted_List is 
   
   procedure Free is new Ada.Unchecked_Deallocation(Element_Type, List_Type);
   
   function Empty(List : in List_Type) return Boolean is
      
   begin
      if (List = null) then
	 return True;
      else 
	 return False;
      end if;
   end Empty;
   
   procedure New_Element(List : in out List_Type;
			 Data : in Integer;
			 TmpPtr: in List_Type) is 
      
   begin 
      List          := New Element_Type;
      List.all.Data := Data;
      List.all.Next := TmpPtr;
   end New_Element;
   
   procedure Insert(List : in out List_Type;
		    Data : in Integer) is 
      
      TmpPtr : List_Type;
      
   begin
      if (Empty(List)) then
	 New_Element(List, Data, null); 
      elsif Data < List.Data then  
	 New_Element(List, Data, List); 
      elsif Data = List.Data then 
	 TmpPtr := null;
      else 
	 Insert(List.Next, Data);
      end if;
      
      if not (Empty(TmpPtr)) then
	 List := TmpPtr;
      end if;
   end Insert;
   
   procedure Put(Item : in List_Type) is 
      
   begin 
      if not (Empty(Item)) then 
	 Put(" ");
	 Put(Item.Data, Width => 0);
	 Put(Item.Next);
      end if;
   end Put;
   
   function Member(List : in List_Type;
		   Data : in Integer) return Boolean is 
      
   begin 
      if Empty(List) then
	 return False;
      elsif (Data = List.Data) then
	 return True;
      else
	 return Member(List.Next, Data);
      end if;
   end Member;
   
   procedure Remove(List : in out List_Type;
		    Data : in Integer) is
      
      TmpPtr : List_Type; 
      
   begin 
      if (Empty(List)) then
	 raise No_Such_Element_Error;
      elsif (Data = List.Data) then
	 TmpPtr := List.Next;
	 Free(List);
	 List := TmpPtr;      
      else
	 Remove(List.Next, Data);
      end if;	 
   end Remove;
   
   procedure Delete(List : in out List_Type) is
      
   begin 
      if not Empty(List) then
	 Delete(List.Next);
	 Free(List);
      end if;
   end Delete;

   function Length(List : in  List_Type) return Natural is
      
   begin
      if Empty(List) then 
	 return 0;
      else
	 return 1 + Length(List.Next);
      end if;
   end Length;
end Sorted_List;
