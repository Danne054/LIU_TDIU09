
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;

procedure T1_Adap30 is 
   
   --subtyper
   subtype Inner_Array_Range1 is 
     Integer range 86..87;
   
   subtype Inner_Array_Range2 is 
     Integer range -43..-42;
   
   subtype Outer_Array_Range is 
     Integer range 51..53;
   
   --typer
   type Inner_Array_Type is 
     array (Inner_Array_Range1, Inner_Array_Range2) of String(1..2);
   
   type Oter_Array is 
     array (Outer_Array_Range) of Inner_Array_Type;
   
   type Post_Type is
      record 
	 N, G : Oter_Array;
      end record;
   
   --get
   procedure Get(Item : out Inner_Array_Type) is
      
      Empty : Character;
   begin
      
      for Y in Item'Range(2) loop
	 for X in Reverse Item'Range(1) loop
	    Get(Item(X, Y));
	    
	    if not (X = Item'First(1) and Y = Item'Last(2)) then
	       Get(Empty);
	    end if;
	 end loop;
      end loop;
   end Get;
   
   procedure Get(Item : out Oter_Array) is 
      
      Empty : Character;
   begin 
      
      for I in reverse Item'Range loop
	 Get(Item(I));
	 
	 if I /= Item'First then
	    Get(Empty);
	 end if;
      end loop;
   end Get;
   
   procedure Get(Item : out Post_Type) is
      
      Empty : Character;
   begin
      
      Get(Item.G);
      Get(Empty);
      Get(Item.N);
   end Get;
   
   --put
   procedure put(Item : in Inner_Array_Type) is
      
   begin
      
      for Y in Item'Range(2) loop
	 
	 for X in Reverse Item'Range(1) loop

	    put(Item(X, Y));

	    if not (X = Item'First(1) and Y = Item'Last(2)) then
	       Put(' ');
	    end if;
	 end loop;
      end loop;
   end put;
   
   procedure Put(Item : in Oter_Array) is 

   begin 
      
      for I in reverse Item'Range loop
	 Put(Item(I));
	 
	 if I /= Item'First then
	    Put(' ');
	 end if;
      end loop;
   end Put;
   
   procedure Put(Item : in Post_Type) is

   begin
      
      Put(Item.G);
      Put(' ');
      Put(Item.N);
   end Put;
   
   T : Post_Type;
begin
   Put("Mata in datamängd: ");
   Get(T);
   Skip_Line;
   
   Put("Inmatad datamängd: ");
   Put(T);
end T1_Adap30;
