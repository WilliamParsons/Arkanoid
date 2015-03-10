local BlueBox = {tag = "blue", HP=1, xPos=0, yPos=0};
function BlueBox:new (o) --constructor
 o = o or {};
 --print(o.xPos, o.yPos)
 setmetatable(o, self);
 self.__index = self;
 return o;
end
function BlueBox:spawn()
	self.shape=display.newRect(self.xPos, self.yPos,114, 50);
	--print(self.xPos, self.yPos)
	self.shape.pp = self; -- parent object
	self.shape.tag = self.tag; -- “enemy”
	self.shape:setFillColor (0,0,1);
	physics.addBody(self.shape, "static");
end

function BlueBox:hit ()
	self.HP = self.HP - 1;
	-- if (self.HP == 0) then
	-- 	-- die
	-- 	self.shape:removeSelf();
	-- 	self.shape=nil;
	-- 	self = nil;
	-- end
	return self.HP
end
function BlueBox:flip ()
	self.HP = 1
	self.shape:setFillColor (1,0,0);
end
return BlueBox