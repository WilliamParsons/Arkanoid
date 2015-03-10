local YellowBox = {tag = "yellow", HP=1, xPos=0, yPos=0};
function YellowBox:new (o) --constructor
	o = o or {};
	-- print(o.xPos, o.yPos)
	setmetatable(o, self);
	self.__index = self;
	return o;
end
function YellowBox:spawn()
	self.shape=display.newRect(self.xPos, self.yPos,114, 50);
	--print(self.xPos, self.yPos)
	self.shape.pp = self; -- parent object
	self.shape.tag = self.tag; -- “enemy”
	self.shape:setFillColor (1,1,0);
	physics.addBody(self.shape, "static");
end

function YellowBox:hit ()
	self.HP = self.HP - 1;
end
return YellowBox