with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;     use Ada.Float_Text_IO;
with Ada.Text_IO;           use Ada.Text_IO;

procedure T4_Adap3 is 
   
   subtype Inner_Array_Range is 
     Character range 'y'..'z';
   
   subtype Oter_Array_Range_X is 
     Character range 'I'..'L';
   
   subtype Oter_Array_Range_Y is 
     Integer range 93..95;
   
   type Inner_Array is 
     array (Inner_Array_Range) of Character;
   
   type Record_Type is 
      record 
	 P, K : Inner_Array;
      end record;
   
   type Oter_Array is 
     array (Oter_Array_Range_X, Oter_Array_Range_Y) of Record_Type;
   
   --Get--
   procedure Get(Item : out Inner_Array) is 
      
      Empty : Character;
   begin
      
      for I in Item'Range loop
	 
	 if not(I = Item'First) then 
	    Get(Empty);
	 end if;
	 
	 Get(Item(I));
      end loop;
   end Get;
   
   procedure Get(Item : out Record_Type) is 
      
      Empty : Character;
   begin
      
      Get(Item.P);
      Get(Empty);
      Get(Item.K);
   end Get;
   
   procedure Get(Item : out Oter_Array) is 
      
      Empty : Character;
   begin
      
      for X in reverse Item'Range(1) loop
	 for Y in Item'Range(2) loop
	    
	    if not (X = Item'Last(1) and Y = Item'First(2)) then
	       Get(Empty);
	    end if;
	    
	    Get(Item(X, Y));
	 end loop;
      end loop;
   end Get;
   
   --put--
   procedure Put(Item : in Inner_Array) is 
      
   begin
      
      for I in reverse Item'Range loop
	 
	 if not (I = Item'Last) then
	    Put(' ');
	 end if;
	 
	 Put(Item(I));
      end loop;
   end Put;
   
   procedure Put(Item : in Record_Type) is 
      
   begin
      
      Put(Item.P);
      Put(' ');
      Put(Item.K);
   end Put;
   
   procedure Put(Item : in Oter_Array) is 
      
   begin
      
      for X in reverse Item'Range(1) loop
   	 for Y in Item'Range(2) loop
	    
   	    if not (X = Item'Last(1) and Y = Item'First(2)) then
   	       Put(' ');
   	    end if;
	    
   	    Put(Item(X, Y));
   	 end loop;
      end loop;
   end Put;
   
   --declarera--
   T : Oter_Array;
begin 
   
   Ada.Text_IO.Put("Mata in datamängd: ");
   Get(T);
   Skip_Line;
   
   Ada.Text_IO.Put("Inmatad datamängd: ");
   Put(T);
end T4_Adap3;
