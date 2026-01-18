package Sorted_List is
   type Element_Type is private;
   
   type List_Type is private; 
   
   procedure Insert(List : in out List_Type;
		    Data : in Integer);
   
   procedure Put(Item : in List_Type);
   
   function Empty(List : in List_Type) return Boolean;
   
   function Member(List : in List_Type;
		   Data : in Integer) return Boolean;
   
   procedure Remove(List : in out List_Type;
		    Data : in Integer);
   
   procedure Delete(List : in out List_Type);
   
   function Length(List : in  List_Type) return Natural;
   
   No_Such_Element_Error : exception;
   
private

   type List_Type is 
     access Element_Type;
   
   type Element_Type is
      record
	 Data :   Integer;
	 Next : List_Type;
      end record;
end Sorted_List;
