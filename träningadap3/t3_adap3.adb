
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;     use Ada.Float_Text_IO;
with Ada.Text_IO;           use Ada.Text_IO;

procedure T3_Adap3 is 
   
   subtype Inner_Array_Range is 
     Integer range -13..-12;
   
   subtype Outer_Array_Range1 is
     Integer range 57..60;
   
   
   subtype Outer_Array_Range2 is
     Integer range -8..-6;
   
   type Inner_Array is 
     array(Inner_Array_Range) of Float;
   
   type Record_Type is 
      record
	 T : String(1..2);
	 C : Inner_Array;
      end record;
   
   type Outer_Array is 
     array(Outer_Array_Range1, Outer_Array_Range2) of Record_Type;
   
   --put--
   procedure Get(Item : out Inner_Array) is 
      Empty : Character; 
      
   begin
      
      for I in Item'Range loop
	 
	 if not (I = Item'First) then
	    Get(Empty);
	 end if;
	 
   	 Get(Item(I));
	 
	 
      end loop;
   end Get;
   
   procedure Get(Item : out Record_Type) is 
      
      Empty : Character;
   begin
      
      Get(Item.T);
      Get(Empty);
      Get(Item.C);
      
   end Get;
   
   procedure Get(Item : out Outer_Array) is 
      
      Empty : Character; 
   begin
      
      for X in reverse Item'Range(1) loop
   	 for Y in Item'Range(2) loop
	    
   	    if not (X = Item'Last(1) and Y = Item'First(2)) then
   	       Get(Empty);
   	    end if; 
	    
   	    Get(Item(X,Y));
	     
   	 end loop;
      end loop;
   end Get;
   
   --put-- 
   procedure Put(Item : in Inner_Array) is 
      
   begin
      
      for I in reverse Item'Range loop
	 
	 if not (I = Item'Last) then
	    Put('_');
	 end if;
	 
   	 Put(Item(I), Fore => 0, Aft => 1, Exp =>0);
      end loop;
   end Put;
   
   
   procedure Put(Item : in Record_Type) is 
      
   begin
      
      Put(Item.T);
      Put('_');
      Put(Item.C);
   end Put;
   
   procedure put(Item : in Outer_Array) is 

      
   begin
      
      for X in reverse Item'Range(1) loop
   	 for Y in Item'Range(2) loop
	    
   	    if not (X = Item'Last(1) and Y = Item'First(2)) then
   	       Put('_');
   	    end if; 
	    
   	    Put(Item(X,Y));

   	 end loop;
      end loop;
   end put;
   
   --declarera--
   T : Outer_Array;
   
begin 
   
   Put("Mata in datamängd: ");
   Get(T);
   Skip_Line;
   
   Put("Inmatad datamängd: ");
   Put(T);
end T3_Adap3;
