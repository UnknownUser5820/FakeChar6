script.Parent = nil;
StopThingy = true
--Shortcuts
C3RGB=function(...)return Color3.fromRGB(...)end
C3=function(...)return Color3.new(...)end
ASin=function(...)return math.asin(...)end
Sin=function(...)return math.sin(...)end
ABS=function(...)return math.abs(...)end
Floor=function(...)return math.floor(...)end
Clamp=function(...)return math.clamp(...)end
ACos=function(...)return math.acos(...)end
Cos=function(...)return math.cos(...)end
Euler=function(...)return CFrame.fromEulerAnglesXYZ(...)end
BrickC=function(...)return BrickColor.new(...)end
UD2=function(...)return UDim2.new(...)end
Rad=function(...)return math.rad(...)end
Inst=function(...)return Instance.new(...)end
Vt=function(...)return Vector3.new(...)end
Cf=function(...)return CFrame.new(...)end
Angles=function(...)return CFrame.Angles(...)end
MRandom=function(...)return math.random(...)end
--
local Ignores = {}
local MainCFrame = Cf(0,0,0)
local HeadCFrame = Cf(0,0,0)
local TorsoCFrame = Cf(0,0,0)
local RightArmCFrame = Cf(0,0,0)
local LeftArmCFrame = Cf(0,0,0)
local RightLegCFrame = Cf(0,0,0)
local LeftLegCFrame = Cf(0,0,0)
--wait(5)
local Player = owner
local NameSave = Player.Name
--wait(1)
local Char = Player.Character
if Char and Char:FindFirstChildOfClass("Part") then
	MainCFrame = Char:FindFirstChildOfClass("Part").CFrame
elseif workspace:FindFirstChildOfClass("Part") then
	MainCFrame = workspace:FindFirstChildOfClass("Part").CFrame * Cf(0,2,0)
else
	MainCFrame = Cf(0,4,0)
end
local Walking = false
local Anim = "Idle"

local Accessories = {}
local FaceTexture = nil
local Face = nil
for _, Accessory in pairs(Char:GetDescendants()) do
	if Accessory:IsA("Accessory") or Accessory:IsA("Hat") or Accessory:IsA("BodyColors") or Accessory:IsA("Shirt") or Accessory:IsA("Pants") or Accessory:IsA("ShirtGraphic") or Accessory:IsA("CharacterMesh") then 
		table.insert(Accessories,Accessory:Clone()) 
	elseif Accessory:IsA("Part") and Accessory.Name == "Head" and Accessory:FindFirstChildOfClass("Decal") then
		FaceTexture = Accessory:FindFirstChildOfClass'Decal'.Texture
	end 
end

local random = "<"..tostring(math.random()..tick())..">"
local random2 = owner.Name .. ":"..tostring(math.random()..tick())

--wait(9)
local Character = Instance.new("Model",workspace)
Character.Name = random2
Character.Archivable = true

local Humanoid = Instance.new("Humanoid",Character)
Humanoid.Name = ""
Humanoid.HealthDisplayType = "AlwaysOff"

local Head = Instance.new("Part",Character)
Head.Name = "Head"
Head.Size = Vt(1,1,1)
Head.Anchored = true
Head.CanCollide = false
Head.CanQuery = false
Head.CanTouch = false
local headMesh = Instance.new("SpecialMesh",Head)
headMesh.MeshType = Enum.MeshType.Head
headMesh.Name = "Mesh"
headMesh.Offset = Vt(0,0,0)
headMesh.Scale = Vt(1.25, 1.25, 1.25)
headMesh.VertexColor = Vt(0,0,0)
local HairAttachment = Instance.new("Attachment")
HairAttachment.Parent = Head
HairAttachment.Position = Vector3.new(0,0.6,0)
HairAttachment.Name = "HairAttachment"
local HatAttachment = Instance.new("Attachment")
HatAttachment.Parent = Head
HatAttachment.Position = Vector3.new(0,0.6,0)
HatAttachment.Name = "HatAttachment"
local FaceFrontAttachment = Instance.new("Attachment")
FaceFrontAttachment.Parent = Head
FaceFrontAttachment.Position = Vector3.new(0,0,-0.6)
FaceFrontAttachment.Name = "FaceFrontAttachment"
local FaceCenterAttachment = Instance.new("Attachment")
FaceCenterAttachment.Parent = Head
FaceCenterAttachment.Position = Vector3.new(0,0,0)
FaceCenterAttachment.Name = "FaceCenterAttachment"

local Camera = Instance.new("Part",workspace)
Camera.Name = random
Camera.Anchored=true
Camera.CanCollide=false
Camera.CanQuery = false
Camera.CanTouch = false
Camera.Transparency=1
Camera.Size=Vector3.new()

local HumanoidRootPart = Instance.new("Part",Character)
HumanoidRootPart.Name = "HumanoidRootPart"
HumanoidRootPart.Size = Vt(2,2,1)
HumanoidRootPart.Transparency = 1
HumanoidRootPart.Anchored = true
HumanoidRootPart.CanQuery = false
HumanoidRootPart.CanTouch = false
--[[
local selec = Instance.new("SelectionBox",HumanoidRootPart)
selec.Adornee = HumanoidRootPart
selec.LineThickness = 0.03
]]
local Torso = Instance.new("Part",Character)
Torso.Name = "Torso"
Torso.Size = Vt(2,2,1)
Torso.CanQuery = false
Torso.CanTouch = false
Torso.CanCollide = false
Torso.Anchored = true
local BodyBackAttachment = Instance.new("Attachment")
BodyBackAttachment.Parent = Torso
BodyBackAttachment.Position = Vector3.new(0,0,0.5)
BodyBackAttachment.Name = "BodyBackAttachment"
local BodyFrontAttachment = Instance.new("Attachment")
BodyFrontAttachment.Parent = Torso
BodyFrontAttachment.Position = Vector3.new(0,0,-0.5)
BodyFrontAttachment.Name = "BodyFrontAttachment"
local LeftCollarAttachment = Instance.new("Attachment")
LeftCollarAttachment.Parent = Torso
LeftCollarAttachment.Position = Vector3.new(-1,1,0)
LeftCollarAttachment.Name = "LeftCollarAttachment"
local NeckAttachment = Instance.new("Attachment")
NeckAttachment.Parent = Torso
NeckAttachment.Position = Vector3.new(0,1,0)
NeckAttachment.Name = "NeckAttachment"
local RightCollarAttachment = Instance.new("Attachment")
RightCollarAttachment.Parent = Torso
RightCollarAttachment.Position = Vector3.new(1,1,0)
RightCollarAttachment.Name = "RightCollarAttachment"
local WaistBackAttachment = Instance.new("Attachment")
WaistBackAttachment.Parent = Torso
WaistBackAttachment.Position = Vector3.new(0,-1,0.5)
WaistBackAttachment.Name = "WaistBackAttachment"
local WaistCenterAttachment = Instance.new("Attachment")
WaistCenterAttachment.Parent = Torso
WaistCenterAttachment.Position = Vector3.new(0,-1,0)
WaistCenterAttachment.Name = "WaistCenterAttachment"
local WaistFrontAttachment = Instance.new("Attachment")
WaistFrontAttachment.Parent = Torso
WaistFrontAttachment.Position = Vector3.new(0,-1,-0.5)
WaistFrontAttachment.Name = "WaistFrontAttachment"

local RightArm = Instance.new("Part",Character)
RightArm.Name = "Right Arm"
RightArm.Size = Vt(1,2,1)
RightArm.Anchored = true
RightArm.CanQuery = false
RightArm.CanTouch = false
RightArm.CanCollide = false
local RightShoulderAttachment = Instance.new("Attachment")
RightShoulderAttachment.Parent = RightArm
RightShoulderAttachment.Position = Vector3.new(0,1,0)
RightShoulderAttachment.Name = "RightShoulderAttachment"
local RightGripAttachment = Instance.new("Attachment") 
RightGripAttachment.Parent = RightArm
RightGripAttachment.Position = Vector3.new(0,-1,0)
RightGripAttachment.Name = "RightGripAttachment"

local LeftArm = Instance.new("Part",Character)
LeftArm.Name = "Left Arm"
LeftArm.Size = Vt(1,2,1)
LeftArm.Anchored = true
LeftArm.CanQuery = false
LeftArm.CanTouch = false
LeftArm.CanCollide = false
local LeftShoulderAttachment = Instance.new("Attachment") 
LeftShoulderAttachment.Parent = LeftArm 
LeftShoulderAttachment.Position = Vector3.new(0,1,0)
LeftShoulderAttachment.Name = "LeftShoulderAttachment"
local LeftGripAttachment = Instance.new("Attachment") 
LeftGripAttachment.Parent = LeftArm 
LeftGripAttachment.Position = Vector3.new(0,-1,0) 
LeftGripAttachment.Name = "LeftGripAttachment"

local RightLeg = Instance.new("Part",Character)
RightLeg.Name = "Right Leg"
RightLeg.Size = Vt(1,2,1)
RightLeg.Anchored = true
RightLeg.CanQuery = false
RightLeg.CanTouch = false
RightLeg.CanCollide = false
local RightFootAttachment = Instance.new("Attachment")
RightFootAttachment.Parent = RightLeg
RightFootAttachment.Position = Vector3.new(0,-1,0)
RightFootAttachment.Name = "RightFootAttachment"

local LeftLeg = Instance.new("Part",Character)
LeftLeg.Name = "Left Leg"
LeftLeg.Size = Vt(1,2,1)
LeftLeg.Anchored = true
LeftLeg.CanQuery = false
LeftLeg.CanTouch = false
LeftLeg.CanCollide = false
local LeftFootAttachment = Instance.new("Attachment")
LeftFootAttachment.Parent = LeftLeg
LeftFootAttachment.Position = Vector3.new(0,-1,0)
LeftFootAttachment.Name = "LeftFootAttachment"

local Sword = Instance.new("Part",Character)
Sword.Material = "Neon"
Sword.Size = Vector3.new(1.975, 7.235, 0.305)
Sword.Color = Color3.new() 
Sword.Transparency = 0 
Sword.Anchored = true
Sword.CanCollide = false 
local SwordMesh = Instance.new("SpecialMesh",Sword)
SwordMesh.MeshType = "FileMesh"
SwordMesh.MeshId = "rbxassetid://871044141"
SwordMesh.TextureId = "rbxassetid://871044152"
SwordMesh.Scale = Vector3.new(0.3, 0.3, 0.3)

local Pitch = 1
local Volume = 1

local sounds1 = {1836136993,1836137223,1836137026,1836136972,1846494282, 1836136826, 1836137180, 1836137299, 1836136835,1836137276,11203974648}

local MusicId = sounds1[math.random(1,#sounds1)] --1837271158--10865035815--10173488798 --10863811714 --10173599201--10234045891--9733088324--1848136868--436447939--6644915660
local Music = Instance.new("Sound",Torso)
Music.Name = "Music"
Music.SoundId = "rbxassetid://11203974648"
Music.Volume = Volume
Music.Pitch = Pitch
Music.Looped = true
Music.Playing = true
local MusicTimePostion = Music.TimePosition

local Effects = Instance.new("Folder",Character)
Effects.Name = "Effects"



local W,A,S,D = false,false,false,false
local FallingSpeed = 0
local Falling = true
local WalkSpeed = 0.5
local FlyMode = false
local ClientCFrame = nil
local Attack = false

local EventBackup = Instance.new("RemoteEvent")
EventBackup.Name = "IEF{".. Player.Name.."}"
local CameraBackup = Instance.new("RemoteEvent")
CameraBackup.Name = "CEF{"..Player.Name.."}"
local EventBackupC = EventBackup:Clone()
local CameraBackupC = CameraBackup:Clone()
game:GetService("TestService"):ClearAllChildren()
local input = NLS([===[
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
local remotestored = game:GetService("TestService")

local Event = remotestored:WaitForChild("IEF{"..Player.Name.."}") 
local CEvent = remotestored:WaitForChild("CEF{"..Player.Name.."}") 
local UIS = game:GetService("UserInputService")
local h,t = Mouse.Hit,Mouse.Target
local input = function(io,a)
	if a then return end
	local io = {KeyCode=io.KeyCode,UserInputType=io.UserInputType,UserInputState=io.UserInputState}
	Event:FireServer(io)
end
UIS.InputBegan:Connect(input)
UIS.InputEnded:Connect(input)
while wait(1/30) do
	CEvent:FireServer(workspace.Camera.CoordinateFrame)
	local cam = workspace.Camera
	if h~=Mouse.Hit or t~=Mouse.Target then
		Event:FireServer({isMouse=true,Target=Mouse.Target,Hit=Mouse.Hit})
		h,t=Mouse.Hit,Mouse.Target
	end
	if workspace:FindFirstChild("]===].. random2 ..[===[") then
		local Character = workspace:FindFirstChild("]===].. random2 ..[===[")
		local Head = Character:FindFirstChild("Head")
		local Torso = Character:FindFirstChild("Torso")
		if Character and Head then
			cam.CameraSubject = Head;
			cam.CameraType = "Custom"
			cam.HeadLocked = true
			cam.HeadScale = 1
			cam.FieldOfView = 70 
		end
		if Character and Torso then
			local LoudEvent = remotestored:FindFirstChild("LoudnessEvent:"..Player.Name)
			local Music = Torso:FindFirstChild("Music")
			if Music then
				LoudEvent:FireServer(Music.PlaybackLoudness)
			end
		end
	else
		warn("Awaiting for Character")
	end
end
]===],Player.PlayerGui)
local CharacterVal = Instance.new("ObjectValue",input)
CharacterVal.Name = "CharacterVal"
CharacterVal.Value = Character
input.Name = "Input"
input.Parent = Player:WaitForChild("PlayerGui")
input.Enabled = true

local LoudnessEvent = Instance.new("RemoteEvent")
LoudnessEvent.Name = "LoudnessEvent:"..Player.Name
LoudnessEvent.Parent = game:GetService("TestService")
local PlaybackLoudness = 0
LoudnessEvent.OnServerEvent:Connect(function(Plr,loud)
	PlaybackLoudness = loud
end)

local InputEvent = Instance.new("RemoteEvent")
InputEvent.Name = "IEF{"..Player.Name.."}"
InputEvent.Parent = game:GetService("TestService")
local CameraEvent = Instance.new("RemoteEvent")
CameraEvent.Name = "CEF{"..Player.Name.."}"
CameraEvent.Parent = game:GetService("TestService")
CameraEvent.OnServerEvent:Connect(function(plr,e)ClientCFrame=e;end)
local CAS = {Actions={}}
local fakeEvent = function()
	local t = {_fakeEvent=true}
	t.Connect = function(self,f)self.Function=f end
	t.connect = t.Connect
	return t
end
local m = {Target=nil,Hit=CFrame.new(),KeyUp=fakeEvent(),KeyDown=fakeEvent(),Button1Up=fakeEvent(),Button1Down=fakeEvent()}
local UIS = {InputBegan=fakeEvent(),InputEnded=fakeEvent()}
function CAS:BindAction(name,fun,touch,...)
	CAS.Actions[name] = {Name=name,Function=fun,Keys={...}}
end
function CAS:UnbindAction(name)
	CAS.Actions[name] = nil
end
local function te(self,ev,...)
	local t = m[ev]
	if t and t._fakeEvent and t.Function then
		t.Function(...)
	end
end
local Mouse,mouse,UserInputService,ContextActionService
do
	m.TrigEvent=te;UIS.TrigEvent=te;InputEvent.OnServerEvent:Connect(function(plr,io)if plr~=Player then return end;if io.isMouse then m.Target=io.Target;m.Hit=io.Hit;elseif io.UserInputType == Enum.UserInputType.MouseButton1 then if io.UserInputState == Enum.UserInputState.Begin then m:TrigEvent("Button1Down");else m:TrigEvent("Button1Up");end else for n,t in pairs(CAS.Actions) do for _,k in pairs(t.Keys) do if k==io.KeyCode then t.Function(t.Name,io.UserInputState,io);end;end;end;if io.UserInputState == Enum.UserInputState.Begin then m:TrigEvent("KeyDown",io.KeyCode.Name:lower());UIS:TrigEvent("InputBegan",io,false)else m:TrigEvent("KeyUp",io.KeyCode.Name:lower());UIS:TrigEvent("InputEnded",io,false);end;end;end)
	Mouse,mouse,UserInputService,ContextActionService,mausee = m,m,UIS,CAS,m
end

local Sine = 0
local Change = 1

local newcframe = CFrame.new(0,0,0)
function TLerp(object, cframe, time)        
	local goalcf=cframe
	local Curtime=0
	while Curtime<time do
		local eq=wait()
		Curtime=Curtime+eq
		local transition=1
		transition=(Sin((((Curtime/time))/57.295779513082)*90))
		local cf=Cf(object.p:Lerp(goalcf.p,transition))
		local rot=Cf(object.p:Lerp(goalcf.p,transition),object.p:Lerp(goalcf.p,transition)+object.lookVector:Lerp(cframe.lookVector,transition))
		newcframe=rot
	end
	return newcframe
end

local ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"

script:WaitForChild("ArtificialHB")
local CHANGE = 2 / 6
local SINE = 0
local Frame_Speed = 0.016666666666666666
Frame_Speed = 1 / 80 -- (1 / 60) OR (1 / 80)
frame = Frame_Speed
local tf = 0
local allowframeloss = false
local tossremainder = false
local lastframe = tick()
script.ArtificialHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.ArtificialHB:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)

function Swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, NUMBER do
			ArtificialHB.Event:wait()
		end
	end
end

function SetTween(SPart,CFr,MoveStyle2,outorin2,AnimTime)
	local MoveStyle = Enum.EasingStyle[MoveStyle2]
	local outorin = Enum.EasingDirection[outorin2]
	local tweeningInformation = TweenInfo.new(AnimTime,MoveStyle,outorin,0,false,0)
	local MoveCF = CFr
	local TweenAnim = game:GetService("TweenService"):Create(SPart,tweeningInformation,MoveCF)
	TweenAnim:Play()
end

local NewAnimSpeed = 0.5

--[[function JJEffects(Type,data)
	--Shortcuts
	local P1 = data.parent
	local material = data.material
	local trans = data.transparency
	local trans2 = data.transparency2
	local siz = data.size
	local siz2 = data.size2
	local cf1 = data.cframe
	local color11 = data.color
	local Time = data.Time or 45
	local Visability = nil
	local Growth = nil
	--Meshes/Blocks
	local EffectType = script.EffectType
	local WCube = EffectType.WeirdCube:Clone()
	local RBlock = EffectType.RoundBlock:Clone()
	local Triangle = EffectType.Triangle:Clone()
	local Blocky = EffectType.Block:Clone()
	local BCircle = EffectType.BlockyCircle:Clone()
	---------------------------------------------
	local Type2 = nil
	coroutine.resume(coroutine.create(function()
		Growth = (siz + siz2)
		Visability = (trans - trans2)
	end))
	if Type == "WCube" then
		coroutine.resume(coroutine.create(function()
			WCube.CFrame = cf1
			WCube.Size = siz
			--WCube.Color = color11
			WCube.Transparency = trans



			SetTween(WCube,{Size = siz2},"Quad","Out",NewAnimSpeed)
			SetTween(WCube,{Color = color11},"Quad","Out",NewAnimSpeed)
			SetTween(WCube,{Transparency = trans2},"Quad","Out",NewAnimSpeed)		
			--WCube.Transparency = Visability
			WCube.Material = Enum.Material[material]
			WCube.Parent = P1
			Swait(Time)
			WCube:Destroy()
		end))
	elseif Type == "RBlock" then
		coroutine.resume(coroutine.create(function()
			RBlock.CFrame = cf1
			--RBlock.Size = siz:Lerp(siz2,0.2)
			--WCube.Color = Color3.fromRGB(0,0,0):Lerp(color11,0.1)
			RBlock.Transparency = trans



			SetTween(RBlock,{Size = siz:Lerp(siz2,0.2)},"Quad","Out",NewAnimSpeed)
			SetTween(RBlock,{Color = color11},"Quad","Out",0.1)
			SetTween(RBlock,{Transparency = trans2},"Quad","Out",NewAnimSpeed)		
			--WCube.Transparency = Visability
			RBlock.Material = Enum.Material[material]
			RBlock.Parent = P1
			Swait(Time)
			RBlock:Destroy()
		end))
	elseif Type == "Triangle" then
		coroutine.resume(coroutine.create(function()
			Triangle.CFrame = cf1
			Triangle.Size = Growth
			Triangle.Color = color11
			Triangle.Transparency = Visability
			Triangle.Material = Enum.Material[material]
			Triangle.Parent = P1
			Swait(Time)
			Triangle:Destroy()
		end))
	elseif Type == "Blocky" then
		coroutine.resume(coroutine.create(function()
			Blocky.CFrame = cf1
			Blocky.Size = Growth
			Blocky.Color = color11
			Blocky.Transparency = Visability
			Blocky.Material = Enum.Material[material]
			Blocky.Parent = P1
			Swait(Time)
			Blocky:Destroy()
		end))
	elseif Type == "BCircle" then
		coroutine.resume(coroutine.create(function()
			BCircle.CFrame = cf1
			BCircle.Size = Growth
			SetTween(BCircle,{Color = color11},"Quad","Out",0.1)
			SetTween(BCircle,{Transparency = Visability},"Quad","Out",NewAnimSpeed)
			BCircle.Material = Enum.Material[material]
			BCircle.Parent = P1
			Swait(Time)
			BCircle:Destroy()
		end))
	end
end]]

function CharAnim(data,Type)
	local RATime = data.AnimDelay1
	local LATime = data.AnimDelay2
	local LLTime = data.AnimDelay4
	local RLTime = data.AnimDelay3
	local NTime = data.AnimDelay5
	local TorsTime = data.AnimDelay6
	local RArmCf = data.RightArm
	local LArmCf = data.LeftArm
	local LLegCf = data.LeftLeg
	local RLegCf = data.RightLeg
	local NeckCf = data.Head
	local TorsoCf = data.Torso
	if Type == "Tween" then
		TorsoCFrame = TLerp(TorsoCFrame,TorsoCf,TorsTime)
		RightArmCFrame = TLerp(RightArmCFrame,RArmCf,RATime)
		LeftArmCFrame = TLerp(LeftArmCFrame,LArmCf,LATime)
		RightLegCFrame = TLerp(RightLegCFrame,RLegCf,RLTime)
		LeftLegCFrame = TLerp(LeftLegCFrame,LLegCf,LLTime)
		HeadCFrame = TLerp(HeadCFrame,NeckCf,NTime)
	else
		TorsoCFrame = TorsoCFrame:lerp(TorsoCf,TorsTime)
		RightArmCFrame = RightArmCFrame:lerp(RArmCf,RATime)
		LeftArmCFrame = LeftArmCFrame:lerp(LArmCf,LATime)
		RightLegCFrame = RightLegCFrame:lerp(RLegCf,RLTime)
		LeftLegCFrame = LeftLegCFrame:lerp(LLegCf,LLTime)
		HeadCFrame = HeadCFrame:lerp(NeckCf,NTime)
	end
end

local CFrameAnimTable = function(data)
	local Part = data.Part
	local End = data.CFrame
	local Values = data.Values
	if Values and Part then
		local AttachedPart = data.Part2
		local CF = (AttachedPart.CFrame * Values.BaseCFrame)
		local LastCFrame = Values.EndCFrame or End
		local EndCFrame = LastCFrame:Lerp(End,Values.Alpha or 1)
		Part.CFrame = (CF * EndCFrame) * Values.AttachedCFrame
		Values.EndCFrame = EndCFrame
	end
end

local NewAnimSpeed = 0.1

Player.Chatted:Connect(function(msg)
	pcall(function()
		if msg:sub(1,13) == "/e ~start" then StopThingy = true end
		if msg:sub(1,10) == "~start" then StopThingy = true end
		if msg:sub(1,6) == "~stop" then StopThingy = false end
		if msg:sub(1,8) == "/e ~stop" then StopThingy = false end
	end)
end)
game.Players.PlayerAdded:Connect(function(plr)
	pcall(function()
		if plr.Name == Player then
			plr.Chatted:Connect(function(msg)
				if msg:sub(1,13) == "/e ~start" then StopThingy = true end
				if msg:sub(1,10) == "~start" then StopThingy = true end
				if msg:sub(1,6) == "~stop" then StopThingy = false end
				if msg:sub(1,8) == "/e ~stop" then StopThingy = false end
			end)
		end
	end)
end)
--Player.Character = Character
local RI,WS,HR = 0,0,0
local Leg1,R1,Leg2,R2 = -1.3,-13,-2,-6
local lf,rf = -0.4,0
function system()
		--[[script:GetPropertyChangedSignal("Disabled"):Connect(function()
			input.Disabled = true
			input:Destroy()
			CameraBackupC:Destroy()
			EventBackupC:Destroy()
			Camera:Destroy()
			game:GetService("TestService"):FindFirstChild("IEF{"..Player.Name.."}"):Destroy()
			game:GetService("TestService"):FindFirstChild("CEF{"..Player.Name.."}"):Destroy()
			game:GetService("TestService"):FindFirstChild("LoudnessEvent:"..Player.Name):Destroy()
			script:ClearAllChildren()
			script.Disabled = true
			script:Destroy()
		end)]]
	game:GetService("RunService").Heartbeat:Connect(function()
		--wait(0.001)
		if StopThingy == false then
			StopThingy = false
			input.Disabled = true
			input:Destroy()
			CameraBackupC:Destroy()
			EventBackupC:Destroy()
			Camera:Destroy()
			game:GetService("TestService"):FindFirstChild("IEF{"..Player.Name.."}"):Destroy()
			game:GetService("TestService"):FindFirstChild("CEF{"..Player.Name.."}"):Destroy()
			game:GetService("TestService"):FindFirstChild("LoudnessEvent:"..Player.Name):Destroy()
			script:ClearAllChildren()
			script.Disabled = true
			script:Destroy()
		end
		local Sine2 = 0
		if StopThingy == true then
			Sine = Sine + 1.5 --+ PlaybackLoudness/190 --*2
			Sine2 = Sine / 5
			coroutine.resume(coroutine.create(function()
				

if Player and Player.Character then 
					local ch = Player.Character 
					Player.Character=nil 
					ch.Parent=nil
				end
				if Character == nil or Character.Parent ~= workspace or Character.Parent == nil or not Character then
					Character = Instance.new("Model",workspace)
					Character.Name = random2
					Character.Archivable = true
					--Player.Character = Character
				end
				if Effects == nil or Effects.Parent ~= Character or Effects.Parent == nil or not Effects then
					Effects = Instance.new("Folder",Character)
					Effects.Name = "Effects"
				end
				if Camera == nil or Camera.Parent ~= workspace or Camera.Parent == nil or not Camera then
					Camera = Instance.new("Part",workspace)
					Camera.Name = random
					Camera.Anchored=true
					Camera.CanCollide=false
					Camera.CanQuery = false
					Camera.CanTouch = false
					Camera.Transparency=1
					Camera.Size=Vector3.new()
				end
				if Torso == nil or Torso.Parent ~= Character or Torso.Parent == nil or not Torso then
					Camera.CFrame=MainCFrame*CFrame.new(0,1.5,0)
				else
					Camera.CFrame=Torso.CFrame*CFrame.new(0,0,0)
				end
				Camera.Anchored=true
				Camera.CanCollide=false
				Camera.Transparency=1
				Camera.Size=Vector3.new()

				if Humanoid == nil or Humanoid.Parent ~= Character or Humanoid.Parent == nil or not Humanoid then
					Humanoid = Instance.new("Humanoid",Character)
					Humanoid.Name = math.random(1,#{"a","b","c","d"})
					Humanoid.HealthDisplayType = "AlwaysOff"
				end
				if Head == nil or Head.Parent ~= Character or Head.Parent == nil or not Head then
					Head = Instance.new("Part",Character)
					Head.Name = "Head"
					Head.Size = Vt(1,1,1)
					Head.Anchored = true
					Head.CanQuery = false
					Head.CanTouch = false
					Head.CanCollide = false
					HairAttachment = Instance.new("Attachment")
					HairAttachment.Parent = Head
					HairAttachment.Position = Vector3.new(0,0.6,0)
					HairAttachment.Name = "HairAttachment"
					HatAttachment = Instance.new("Attachment")
					HatAttachment.Parent = Head
					HatAttachment.Position = Vector3.new(0,0.6,0)
					HatAttachment.Name = "HatAttachment"
					FaceFrontAttachment = Instance.new("Attachment")
					FaceFrontAttachment.Parent = Head
					FaceFrontAttachment.Position = Vector3.new(0,0,-0.6)
					FaceFrontAttachment.Name = "FaceFrontAttachment"
					FaceCenterAttachment = Instance.new("Attachment")
					FaceCenterAttachment.Parent = Head
					FaceCenterAttachment.Position = Vector3.new(0,0,0)
					FaceCenterAttachment.Name = "FaceCenterAttachment"
				end
				if Face == nil or Face.Parent ~= Head or Face.Parent == nil or not Face then
					Face = Instance.new("Decal",Head)
					Face.Face = "Front"
					Face.Texture = FaceTexture
				end
				if headMesh == nil or headMesh.Parent ~= Head or headMesh.Parent == nil or not headMesh then
					headMesh = Instance.new("SpecialMesh",Head)
					headMesh.MeshType = Enum.MeshType.Head
					headMesh.Name = "Mesh"
					headMesh.Offset = Vt(0,0,0)
					headMesh.Scale = Vt(1.25, 1.25, 1.25)
					headMesh.VertexColor = Vt(0,0,0)
				end
				if HumanoidRootPart == nil or HumanoidRootPart.Parent ~= Character or HumanoidRootPart.Parent == nil or not HumanoidRootPart then
					HumanoidRootPart = Instance.new("Part",Character)
					HumanoidRootPart.Name = "HumanoidRootPart"
					HumanoidRootPart.Size = Vt(2,2,1)
					HumanoidRootPart.Transparency = 1
					HumanoidRootPart.Anchored = true
					HumanoidRootPart.CanQuery = false
					HumanoidRootPart.CanTouch = false
					HumanoidRootPart.CanCollide = false
				end
				if Torso == nil or Torso.Parent ~= Character or Torso.Parent == nil or not Torso then
					Torso = Instance.new("Part",Character)
					Torso.Name = "Torso"
					Torso.Size = Vt(2,2,1)
					Torso.Anchored = true
					Torso.CanQuery = false
					Torso.CanTouch = false
					Torso.CanCollide = false
					BodyBackAttachment = Instance.new("Attachment")
					BodyBackAttachment.Parent = Torso
					BodyBackAttachment.Position = Vector3.new(0,0,0.5)
					BodyBackAttachment.Name = "BodyBackAttachment"
					BodyFrontAttachment = Instance.new("Attachment")
					BodyFrontAttachment.Parent = Torso
					BodyFrontAttachment.Position = Vector3.new(0,0,-0.5)
					BodyFrontAttachment.Name = "BodyFrontAttachment"
					LeftCollarAttachment = Instance.new("Attachment")
					LeftCollarAttachment.Parent = Torso
					LeftCollarAttachment.Position = Vector3.new(-1,1,0)
					LeftCollarAttachment.Name = "LeftCollarAttachment"
					NeckAttachment = Instance.new("Attachment")
					NeckAttachment.Parent = Torso
					NeckAttachment.Position = Vector3.new(0,1,0)
					NeckAttachment.Name = "NeckAttachment"
					RightCollarAttachment = Instance.new("Attachment")
					RightCollarAttachment.Parent = Torso
					RightCollarAttachment.Position = Vector3.new(1,1,0)
					RightCollarAttachment.Name = "RightCollarAttachment"
					WaistBackAttachment = Instance.new("Attachment")
					WaistBackAttachment.Parent = Torso
					WaistBackAttachment.Position = Vector3.new(0,-1,0.5)
					WaistBackAttachment.Name = "WaistBackAttachment"
					WaistCenterAttachment = Instance.new("Attachment")
					WaistCenterAttachment.Parent = Torso
					WaistCenterAttachment.Position = Vector3.new(0,-1,0)
					WaistCenterAttachment.Name = "WaistCenterAttachment"
					WaistFrontAttachment = Instance.new("Attachment")
					WaistFrontAttachment.Parent = Torso
					WaistFrontAttachment.Position = Vector3.new(0,-1,-0.5)
					WaistFrontAttachment.Name = "WaistFrontAttachment"
				end
				if RightArm == nil or RightArm.Parent ~= Character or RightArm.Parent == nil or not RightArm then
					RightArm = Instance.new("Part",Character)
					RightArm.Name = "Right Arm"
					RightArm.Size = Vt(1,2,1)
					RightArm.Anchored = true
					RightArm.CanQuery = false
					RightArm.CanTouch = false
					RightArm.CanCollide = false
					RightShoulderAttachment = Instance.new("Attachment")
					RightShoulderAttachment.Parent = RightArm
					RightShoulderAttachment.Position = Vector3.new(0,1,0)
					RightShoulderAttachment.Name = "RightShoulderAttachment"
					RightGripAttachment = Instance.new("Attachment") 
					RightGripAttachment.Parent = RightArm
					RightGripAttachment.Position = Vector3.new(0,-1,0)
					RightGripAttachment.Name = "RightGripAttachment"
				end
				if LeftArm == nil or LeftArm.Parent ~= Character or LeftArm.Parent == nil or not LeftArm then
					LeftArm = Instance.new("Part",Character)
					LeftArm.Name = "Left Arm"
					LeftArm.Size = Vt(1,2,1)
					LeftArm.Anchored = true
					LeftArm.CanQuery = false
					LeftArm.CanTouch = false
					LeftArm.CanCollide = false
					LeftShoulderAttachment = Instance.new("Attachment") 
					LeftShoulderAttachment.Parent = LeftArm 
					LeftShoulderAttachment.Position = Vector3.new(0,1,0)
					LeftShoulderAttachment.Name = "LeftShoulderAttachment"
					LeftGripAttachment = Instance.new("Attachment") 
					LeftGripAttachment.Parent = LeftArm 
					LeftGripAttachment.Position = Vector3.new(0,-1,0) 
					LeftGripAttachment.Name = "LeftGripAttachment"
				end
				if RightLeg == nil or RightLeg.Parent ~= Character or RightLeg.Parent == nil or not RightLeg then
					RightLeg = Instance.new("Part",Character)
					RightLeg.Name = "Right Leg"
					RightLeg.Size = Vt(1,2,1)
					RightLeg.Anchored = true
					RightLeg.CanQuery = false
					RightLeg.CanTouch = false
					RightLeg.CanCollide = false
					RightFootAttachment = Instance.new("Attachment")
					RightFootAttachment.Parent = RightLeg
					RightFootAttachment.Position = Vector3.new(0,-1,0)
					RightFootAttachment.Name = "RightFootAttachment"
				end
				if LeftLeg == nil or LeftLeg.Parent ~= Character or LeftLeg.Parent == nil or not LeftLeg then
					LeftLeg = Instance.new("Part",Character)
					LeftLeg.Name = "Left Leg"
					LeftLeg.Size = Vt(1,2,1)
					LeftLeg.Anchored = true
					LeftLeg.CanQuery = false
					LeftLeg.CanTouch = false
					LeftLeg.CanCollide = false
					LeftFootAttachment = Instance.new("Attachment")
					LeftFootAttachment.Parent = LeftLeg
					LeftFootAttachment.Position = Vector3.new(0,-1,0)
					LeftFootAttachment.Name = "LeftFootAttachment"
				end
				if Sword == nil or Sword.Parent ~= Character or Sword.Parent == nil or not Sword then
					Sword = Instance.new("Part",Character)
					Sword.Material = "Neon"
					Sword.Size = Vector3.new(1.975, 7.235, 0.305)
					Sword.Color = Color3.new() 
					Sword.Transparency = 0 
					Sword.Anchored = true
					Sword.CanCollide = false 
				end
				if SwordMesh == nil or SwordMesh.Parent ~= Sword or SwordMesh.Parent == nil or not SwordMesh then
					SwordMesh = Instance.new("SpecialMesh",Sword)
					SwordMesh.MeshType = "FileMesh"
					SwordMesh.MeshId = "rbxassetid://871044141"
					SwordMesh.TextureId = "rbxassetid://871044152"
					SwordMesh.Scale = Vector3.new(0.3, 0.3, 0.3)
				end
				if Music == nil or Music.Parent ~= Torso or Music.Parent == nil or not Music then
					MusicId = sounds1[math.random(1,#sounds1)]
					Music = Instance.new("Sound",Torso)
					Music.Name = "Music"
					Music.SoundId = "rbxassetid://"..tostring(MusicId)
					Music.Volume = Volume
					Music.Pitch = Pitch
					Music.Looped = true
					Music.Playing = true
					Music.TimePosition = MusicTimePostion
					MusicTimePostion = Music.TimePosition
				end
				LeftLeg.Name = "Left Leg"
				LeftLeg.Size = Vt(1,2,1)
				LeftLeg.Anchored = true
				LeftLeg.CanQuery = false
				LeftLeg.CanTouch = false
				LeftLeg.CanCollide = false
				RightLeg.Name = "Right Leg"
				RightLeg.Size = Vt(1,2,1)
				RightLeg.Anchored = true
				RightLeg.CanQuery = false
				RightLeg.CanTouch = false
				RightLeg.CanCollide = false
				LeftArm.Name = "Left Arm"
				LeftArm.Size = Vt(1,2,1)
				LeftArm.Anchored = true
				LeftArm.CanQuery = false
				LeftArm.CanTouch = false
				LeftArm.CanCollide = false
				RightArm.Name = "Right Arm"
				RightArm.Size = Vt(1,2,1)
				RightArm.Anchored = true
				RightArm.CanQuery = false
				RightArm.CanTouch = false
				RightArm.CanCollide = false
				Torso.Name = "Torso"
				Torso.Size = Vt(2,2,1)
				Torso.Anchored = true
				Torso.CanQuery = false
				Torso.CanTouch = false
				Torso.CanCollide = false
				HumanoidRootPart.Name = "HumanoidRootPart"
				HumanoidRootPart.Size = Vt(2,2,1)
				HumanoidRootPart.Transparency = 1
				HumanoidRootPart.Anchored = true
				HumanoidRootPart.CanQuery = false
				HumanoidRootPart.CanTouch = false
				HumanoidRootPart.CanCollide = false
				Head.Size = Vt(1,1,1)
				Head.Anchored = true
				Head.CanQuery = false
				Head.CanTouch = false
				Head.CanCollide = false
				headMesh.MeshType = Enum.MeshType.Head
				headMesh.Name = "Mesh"
				headMesh.Offset = Vt(0,0,0)
				headMesh.Scale = Vt(1.25, 1.25, 1.25)
				headMesh.VertexColor = Vt(0,0,0)
				Sword.Material = "Neon"
				Sword.Size = Vector3.new(1.975, 7.235, 0.305)
				Sword.Color = Color3.new() 
				Sword.Transparency = 0 
				Sword.Anchored = true
				Sword.CanCollide = false 
				SwordMesh.MeshType = "FileMesh"
				SwordMesh.MeshId = "rbxassetid://871044141"
				SwordMesh.TextureId = "rbxassetid://871044152"
				SwordMesh.Scale = Vector3.new(0.3, 0.3, 0.3)
				if Character:FindFirstChildOfClass("Accessory") == nil then
					for i=1,#Accessories do
						if Accessories[i]:IsA("Accessory") then
							Accessories[i]:Clone().Parent=Character
						end
					end
				end
				if Character:FindFirstChildOfClass("Hat") == nil then
					for i=1,#Accessories do
						if Accessories[i]:IsA("Hat") then
							Accessories[i]:Clone().Parent=Character
						end
					end
				end
				if Character:FindFirstChildOfClass("BodyColors") == nil then
					for i=1,#Accessories do
						if Accessories[i]:IsA("BodyColors") then
							Accessories[i]:Clone().Parent=Character
						end
					end
				end
				if Character:FindFirstChildOfClass("Shirt") == nil then
					for i=1,#Accessories do
						if Accessories[i]:IsA("Shirt") then
							Accessories[i]:Clone().Parent=Character
						end
					end
				end
				if Character:FindFirstChildOfClass("Pants") == nil then
					for i=1,#Accessories do
						if Accessories[i]:IsA("Pants") then
							Accessories[i]:Clone().Parent=Character
						end
					end
				end
				if Character:FindFirstChildOfClass("ShirtGraphic") == nil then
					for i=1,#Accessories do
						if Accessories[i]:IsA("ShirtGraphic") then
							Accessories[i]:Clone().Parent=Character
						end
					end
				end
				if Character:FindFirstChildOfClass("CharacterMesh") == nil then
					for i=1,#Accessories do
						if Accessories[i]:IsA("CharacterMesh") then
							Accessories[i]:Clone().Parent=Character
						end
					end
				end
				local CharacterGetChildren = Character:GetChildren()
				for i=1,#CharacterGetChildren do
					if CharacterGetChildren[i] == Head 
						or
						CharacterGetChildren[i] == HumanoidRootPart
						or
						CharacterGetChildren[i] == Torso
						or
						CharacterGetChildren[i] == RightLeg
						or
						CharacterGetChildren[i] == Humanoid
						or
						CharacterGetChildren[i] == LeftLeg
						or
						CharacterGetChildren[i] == RightArm
						or
						CharacterGetChildren[i] == LeftArm
						or
						CharacterGetChildren[i] == Music
						or
						CharacterGetChildren[i] == Effects
						or
						CharacterGetChildren[i] == Sword
						or
						CharacterGetChildren[i]:IsA("Accessory")
						or
						CharacterGetChildren[i]:IsA("Hat")
						or
						CharacterGetChildren[i]:IsA("Shirt")
						or
						CharacterGetChildren[i]:IsA("Pants")
						or
						CharacterGetChildren[i]:IsA("BodyColors")
						or
						CharacterGetChildren[i]:IsA("ShirtGraphic")
						or
						CharacterGetChildren[i]:IsA("CharacterMesh")
					then else
						CharacterGetChildren[i]:Destroy()
					end
				end
			end))
			coroutine.resume(coroutine.create(function()
				if Player and Player:WaitForChild('Backpack') then
					Player:WaitForChild('Backpack'):ClearAllChildren()
				end
			end))
			local MainCFrameRay=Ray.new(MainCFrame.p,(Cf(0,-1,0).p).unit*4)
			local MCFPos,Hit=workspace:FindPartOnRayWithIgnoreList(MainCFrameRay,{Character,Camera},false,true)
			Walking = false
			if FlyMode == false then
				if MCFPos ~= nil and (MCFPos.CanCollide ~= false or MCFPos.CanCollide == true) then
					Falling = false
					FallingSpeed = 0
					MainCFrame = MainCFrame*Cf(0,Hit.Y-MainCFrame.Y+3,0)
				elseif MCFPos ~= nil and (MCFPos.CanCollide ~= true or MCFPos.CanCollide == false) then
					table.insert(Ignores,MCFPos)
				elseif MCFPos == nil then 
					Falling = true
					FallingSpeed = FallingSpeed+.06
					MainCFrame = MainCFrame-Vt(0,FallingSpeed,0)
				end 
			end
			if W or A or S or D then
				if FlyMode == true then
					MainCFrame = Cf(MainCFrame.p,ClientCFrame.p)
				else
					MainCFrame = Cf(MainCFrame.p,Vt(ClientCFrame.x,MainCFrame.y,ClientCFrame.z))
					Walking = true
				end
			end

			local oldMainCFrame=MainCFrame

			RI,WS,HR = 0,0,0
			Leg1,R1,Leg2,R2 = -1.3,-13,-2,-6
			lf,rf = -0.4,0
			if W then
				MainCFrame=MainCFrame*CFrame.new(0,0,WalkSpeed)
				WS = WS+45
				HR = -HR-23
				Leg1 = -2
				R1 = -12
				Leg2 = -2
				R2 = -12
			end
			if S then
				MainCFrame=MainCFrame*CFrame.new(0,0,-WalkSpeed)
				WS = -WS-32
				HR = HR+23
				Leg1 = -2
				R1 = 12
				Leg2 = -2
				R2 = 12
			end
			if A then
				MainCFrame=MainCFrame*CFrame.new(WalkSpeed,0,0)
				RI = RI+25+WalkSpeed
				Leg1 = -2
				rf = 0
				R1 = -6
				Leg2 = -1.3
				lf = -0.4
				R2 = -13
			end
			if D then
				MainCFrame=MainCFrame*CFrame.new(-WalkSpeed,0,0)
				RI = -RI-32-WalkSpeed
				Leg1 = -1.3
				rf = -0.4
				R1 = -13
				Leg2 = -2
				lf = 0
				R2 = -6
			end
			if MainCFrame.Y <= -200 then -- Anti void fall
				FallingSpeed = 0
				MainCFrame = MainCFrame+Vector3.new(0,250,0)
			end

			--[==[
			if math.random(1,200) == 15 then
				coroutine.resume(coroutine.create(function()
					local pos = Head.CFrame * Angles(Rad(Sine*5),0,0) * Cf(0,0,-3)
					local lol = pos.Position + Vector3.new(math.random(2,5)+6*Sin(Sine/12),math.random(2,5)+6*Sin(Sine/12),math.random(-12,12))
					local meth = math.random(15,25)
					for i = 1,meth do
						Swait(0.1)
						if i == meth then
							local exactpos = pos
							local andlol = lol + Vector3.new(0,1+i,0)
							local sametime = math.random(35,45) - i
							WACKYEFFECT2({
								Time = sametime,
								EffectType = "Sphere",
								Size = Vt(0.5,0.5,0.5),
								Size2 = Vt(0.3*i,0.3*i,0.3*i)/0.9,
								Transparency = 0,
								Transparency2 = 1,
								CFrame = exactpos,
								MoveToPos = andlol,
								RotationX = math.random(-3,3),
								RotationY = math.random(-3,3),
								RotationZ = math.random(-3,3),
								Material = "Neon",
								Color = Color3.fromRGB(255, 1, 1),
								Color2 = Color3.fromRGB(255, 201, 6),
								SoundID = nil,
								SoundPitch = nil,
								SoundVolume = nil,
								UseBoomerangeMath = true,
								Boomerang = 15,
								SizeBoomerang = 0
							})
							WACKYEFFECT2({
								Time = sametime,
								EffectType = "Spikes",
								Size = Vt(0.5,0.5,0.5),
								Size2 = Vt(0.3*i,0.3*i,0.3*i)/1,
								Transparency = 0,
								Transparency2 = 1,
								CFrame = exactpos,
								MoveToPos = andlol,
								RotationX = math.random(-3,3),
								RotationY = math.random(-3,3),
								RotationZ = math.random(-3,3),
								Material = "Neon",
								Color = Color3.fromRGB(7, 2, 0),
								Color2 = Color3.fromRGB(166, 161, 161),
								SoundID = nil,
								SoundPitch = nil,
								SoundVolume = nil,
								UseBoomerangeMath = true,
								Boomerang = 15,
								SizeBoomerang = 0
							})
						else
							WACKYEFFECT2({
								Time = math.random(35,45) - i,
								EffectType = "Box",
								Size = Vt(0.5,0.5,0.5),
								Size2 = Vt(0.3*i,0.5*i,0.3*i)/5,
								Transparency = 0,
								Transparency2 = 1,
								CFrame = pos,
								MoveToPos = lol + Vector3.new(0,1+i,0),
								RotationX = math.random(-3,3),
								RotationY = math.random(-3,3),
								RotationZ = math.random(-3,3),
								Material = "Neon",
								Color = Color3.fromRGB(255, 81, 0),
								Color2 = Color3.fromRGB(89, 0, 0),
								SoundID = nil,
								SoundPitch = nil,
								SoundVolume = nil,
								UseBoomerangeMath = true,
								Boomerang = 15,
								SizeBoomerang = 0
							})
						end

					end
				end))
			end]==]
			if FlyMode == false then
				if not Falling then
					if(MainCFrame.X~=oldMainCFrame.X or MainCFrame.Z~=oldMainCFrame.Z)then
						Anim = "Walk"
                        Alpha = 1
						--MainCFrame=CFrame.new(MainCFrame.p,oldMainCFrame.p)
						if Attack == false then
							local Velocity = (MainCFrame.Position - oldMainCFrame.Position)
							local Direction
							if Velocity.magnitude > 0.1 then
								Direction = (CFrame.lookAt(MainCFrame.Position,MainCFrame.Position+(Velocity)*10)).LookVector
							else
								Direction = Vector3.new(0,0,0)
							end
							local LookDir = Direction * MainCFrame.LookVector
							local RightDir = Direction * MainCFrame.RightVector
							local UpDir = Direction * MainCFrame.UpVector
							local fnt = (LookDir.X+LookDir.Z+LookDir.Y)
							local lft = (RightDir.X+RightDir.Z+RightDir.Y)
							local top = (UpDir.X+UpDir.Z+UpDir.Y)
							local rlft = math.round(lft)
							local rfnt = math.round(fnt)
							local rtop = math.round(top)
							local th = 0.15
							local lm = 0.7
							local lh = 0.3
							local wsv = 3
							local walkang = 30--25
							local baseang = 10--15
							local afnt = math.abs(rfnt)
							local alft = math.abs(rlft)
							local legturn = 20
							local torsoturn = 15
							local am = 0.2
							local ah = 0.1
							local armang = 40
							local armrot = 15
							local walkangle = 5--5

							CFrameAnimTable({
								Part=Torso;
								Part2=HumanoidRootPart;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(),
									AttachedCFrame = CFrame.new(),
									Alpha = Alpha
								};
								CFrame = Cf(0,th*Cos(Sine2/(wsv/2)),0) * Angles(Rad((-walkangle*fnt)),Rad(180+(torsoturn*lft)-5*Cos((Sine2)/wsv)),Rad((walkangle*lft)));
							})

							CFrameAnimTable({
								Part=Head;
								Part2=Torso;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(0,0.9,0),
									AttachedCFrame = CFrame.new(0,0.625,0),
									Alpha = Alpha
								};
								CFrame = Cf(0,0,0) * Angles(Rad(((-5*Cos((Sine2+0.3)/(wsv/2)))*fnt)+(-walkangle*fnt)),Rad((10*lft)),Rad((-5*Cos((Sine2+0.3)/(wsv/2)))*lft));
							})

							CFrameAnimTable({
								Part=RightArm;
								Part2=Torso;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(1,0.5,0),
									AttachedCFrame = CFrame.new(0.5,-0.5,0),
									Alpha = Alpha
								};
								CFrame = Cf(0,0,(am*Cos((Sine2+0.5)/wsv))*fnt) * Angles(Rad(((-armang*Cos((Sine2)/wsv))*fnt)-(walkangle*fnt)),Rad(((armrot*Cos((Sine2+0.25)/wsv))*fnt)),Rad(5+((armang/3)*Cos((Sine2)/wsv))*lft));
							})

							CFrameAnimTable({
								Part=LeftArm;
								Part2=Torso;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(-1,0.5,0),
									AttachedCFrame = CFrame.new(-0.5,-0.5,0),
									Alpha = Alpha
								};
								CFrame = Cf(0,0,(-am*Cos((Sine2+0.5)/wsv))*fnt) * Angles(Rad(((armang*Cos((Sine2)/wsv))*fnt)-(walkangle*fnt)),Rad(((armrot*Cos((Sine2+0.25)/wsv))*fnt)),Rad(-5-((armang/3)*Cos((Sine2)/wsv))*lft));
							})
							CFrameAnimTable({
								Part=Sword;
								Part2=LeftArm;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(0,-0.9,0),
									AttachedCFrame = CFrame.new(0,3,0),
									Alpha = Alpha
								};
								CFrame = Cf(0,0,0) * Angles(Rad(-90),Rad(90),Rad(5*Cos(Sine2/23)));
							})
							CFrameAnimTable({
								Part=RightLeg;
								Part2=Torso;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(1,-1.5,0),
									AttachedCFrame = CFrame.new(-0.5,-0.5,0),
									Alpha = Alpha
								};
								CFrame = Cf(((-lm*Sin((Sine2+1.35)/wsv))*-lft),-th*Cos(Sine2/(wsv/2))-lh*Cos((Sine2+1.35)/wsv)-(Rad(-walkangle*(-lft+afnt))),((-lm*Sin((Sine2+1.35)/wsv))*fnt)+Rad((torsoturn*lft))) * Angles(Rad((((walkang*Sin((Sine2)/wsv))*fnt)+(-baseang*afnt))+(-walkangle*fnt)),Rad(((legturn)*(fnt*lft))-(torsoturn*lft)),Rad((((walkang*Sin((Sine2)/wsv))*lft))+(-walkangle*lft)));
							})
							CFrameAnimTable({
								Part=LeftLeg;
								Part2=Torso;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(-1,-1.5,0),
									AttachedCFrame = CFrame.new(0.5,-0.5,0),
									Alpha = Alpha
								};
								CFrame = Cf(((lm*Sin((Sine2+1.35)/wsv))*-lft),-th*Cos(Sine2/(wsv/2))+lh*Cos((Sine2+1.35)/wsv)-(Rad(-walkangle*(lft+afnt))),((lm*Sin((Sine2+1.35)/wsv))*fnt)-Rad((torsoturn*lft))) * Angles(Rad((((-walkang*Sin((Sine2)/wsv))*fnt)+(-baseang*afnt))+(-walkangle*fnt)),Rad(((legturn)*(fnt*lft))-(torsoturn*lft)),Rad((((-walkang*Sin((Sine2)/wsv))*lft))+(-walkangle*lft)));
							})
						end
					else
						if Attack == false then
							Anim = "Idle"
                            Alpha = 1
							CFrameAnimTable({
								Part=Torso;
								Part2=HumanoidRootPart;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(),
									AttachedCFrame = CFrame.new(),
									Alpha = Alpha
								};
								CFrame = Cf(0, 0-0.09*Sin(Sine/45), 0) *  Angles(Rad(-12), Rad(180), Rad(0));
							})
							CFrameAnimTable({
								Part=Head;
								Part2=Torso;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(0,0.9,0),
									AttachedCFrame = CFrame.new(0,0.625,0),
									Alpha = Alpha
								};
								CFrame = Cf(0,0,0) * Angles(Rad(0),Rad(0),Rad(0));
							})
							CFrameAnimTable({
								Part=RightArm;
								Part2=Torso;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(1,0.5,0),
									AttachedCFrame = CFrame.new(0.5,-0.5,0),
									Alpha = Alpha
								};
								CFrame = Cf(-0.5,-0.05+0.06*Sin(Sine/48),0.4) * Angles(Rad(-12),Rad(0),Rad(-23));
							})
							CFrameAnimTable({
								Part=LeftArm;
								Part2=Torso;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(-1,0.5,0),
									AttachedCFrame = CFrame.new(-0.5,-0.5,0),
									Alpha = Alpha
								};
								CFrame = Cf(0,-0.05+0.09*Sin(Sine/55),0.3+0.03*Sin(Sine/48)) * Angles(Rad(0),Rad(23),Rad(-18+5*Sin(Sine/55)));
							})
							CFrameAnimTable({
								Part=Sword;
								Part2=LeftArm;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(0,-0.9,0),
									AttachedCFrame = CFrame.new(0,3,0),
									Alpha = Alpha
								};
								CFrame = Cf(0,0,0) * Angles(Rad(-90),Rad(90),Rad(5*math.cos(Sine/45)));
							})
							CFrameAnimTable({
								Part=RightLeg;
								Part2=Torso;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(1,-1.5,0),
									AttachedCFrame = CFrame.new(-0.5,-0.5,0),
									Alpha = Alpha
								};
								CFrame = Cf(0.05,0+0.08*Sin(Sine/45),0.2) * Angles(Rad(-6),Rad(-8),Rad(5));
							})
							CFrameAnimTable({
								Part=LeftLeg;
								Part2=Torso;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(-1,-1.5,0),
									AttachedCFrame = CFrame.new(0.5,-0.5,0),
									Alpha = Alpha
								};
								CFrame = Cf(-0.06,0+0.09*Sin(Sine/45),-0.1) * Angles(Rad(12),Rad(23),Rad(-5));
							})
						end
					end
				elseif Falling then 
					if(MainCFrame.X~=oldMainCFrame.X or MainCFrame.Z~=oldMainCFrame.Z) then MainCFrame=CFrame.new(MainCFrame.p,oldMainCFrame.p)end
					if Attack == false then
						if FallingSpeed>0 then
							Anim = "Fall"
							Alpha = 0.1
							CFrameAnimTable({
								Part=Torso;
								Part2=HumanoidRootPart;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(),
									AttachedCFrame = CFrame.new(),
									Alpha = Alpha
								};
								CFrame = Cf(0,0,0) * Angles(Rad(25+3*Sin(Sine/15)),Rad(180),Rad(0));
							})
							CFrameAnimTable({
								Part=Head;
								Part2=Torso;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(0,0.9,0),
									AttachedCFrame = CFrame.new(0,0.625,0),
									Alpha = Alpha
								};
								CFrame = Cf(0,0,0) * Angles(Rad(-25),Rad(0),Rad(0));
							})
							CFrameAnimTable({
								Part=RightArm;
								Part2=Torso;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(1,0.5,0),
									AttachedCFrame = CFrame.new(0.5,-0.5,0),
									Alpha = Alpha
								};
								CFrame = Cf(0.3,0,0) * Angles(Rad(0),Rad(0),Rad(95));
							})
							CFrameAnimTable({
								Part=LeftArm;
								Part2=Torso;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(-1,0.5,0),
									AttachedCFrame = CFrame.new(-0.5,-0.5,0),
									Alpha = Alpha
								};
								CFrame = Cf(-0.3,0,0) * Angles(Rad(0),Rad(0),Rad(-95));
							})
							CFrameAnimTable({
								Part=Sword;
								Part2=LeftArm;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(0,-0.9,0),
									AttachedCFrame = CFrame.new(0,3,0),
									Alpha = Alpha
								};
								CFrame = Cf(0,0,0) * Angles(Rad(-90),Rad(90),Rad(5*math.cos(Sine/45)));
							})
							CFrameAnimTable({
								Part=RightLeg;
								Part2=Torso;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(1,-1.5,0),
									AttachedCFrame = CFrame.new(-0.5,-0.5,0),
									Alpha = Alpha
								};
								CFrame = Cf(0,0.5,-0.3) * Angles(Rad(-25-6*Sin(Sine/15)),Rad(-25),Rad(0));
							})
							CFrameAnimTable({
								Part=LeftLeg;
								Part2=Torso;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(-1,-1.5,0),
									AttachedCFrame = CFrame.new(0.5,-0.5,0),
									Alpha = Alpha
								};
								CFrame = Cf(0,0.4,0) * Angles(Rad(-15+3*Sin(Sine/15)),Rad(0),Rad(0));
							})
						else
							Anim = "Jump"
							Alpha = 0.1
							CFrameAnimTable({
								Part=Torso;
								Part2=HumanoidRootPart;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(),
									AttachedCFrame = CFrame.new(),
									Alpha = Alpha
								};
								CFrame = Cf(0,0,0) * Angles(Rad(0),Rad(180),Rad(0));
							})
							CFrameAnimTable({
								Part=Head;
								Part2=Torso;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(0,0.9,0),
									AttachedCFrame = CFrame.new(0,0.625,0),
									Alpha = Alpha
								};
								CFrame = Cf(0,0,0) * Angles(Rad(-25),Rad(0),Rad(0));
							})
							CFrameAnimTable({
								Part=RightArm;
								Part2=Torso;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(1,0.5,0),
									AttachedCFrame = CFrame.new(0.5,-0.5,0),
									Alpha = Alpha
								};
								CFrame = Cf(0,0.3,0) * Angles(Rad(180),Rad(0),Rad(0));
							})
							CFrameAnimTable({
								Part=LeftArm;
								Part2=Torso;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(-1,0.5,0),
									AttachedCFrame = CFrame.new(-0.5,-0.5,0),
									Alpha = Alpha
								};
								CFrame = Cf(0,0,0) * Angles(Rad(0),Rad(0),Rad(-25));
							})
							CFrameAnimTable({
								Part=Sword;
								Part2=LeftArm;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(0,-0.9,0),
									AttachedCFrame = CFrame.new(0,3,0),
									Alpha = Alpha
								};
								CFrame = Cf(0,0,0) * Angles(Rad(-90),Rad(90),Rad(5*math.cos(Sine/45)));
							})
							CFrameAnimTable({
								Part=RightLeg;
								Part2=Torso;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(1,-1.5,0),
									AttachedCFrame = CFrame.new(-0.5,-0.5,0),
									Alpha = Alpha
								};
								CFrame = Cf(0,0.5,-0.3) * Angles(Rad(-25-6*Sin(Sine/15)),Rad(-25),Rad(0));
							})
							CFrameAnimTable({
								Part=LeftLeg;
								Part2=Torso;
								Values = {
									EndCFrame = nil,
									BaseCFrame = CFrame.new(-1,-1.5,0),
									AttachedCFrame = CFrame.new(0.5,-0.5,0),
									Alpha = Alpha
								};
								CFrame = Cf(0,0.4,0) * Angles(Rad(-15+3*Sin(Sine/15)),Rad(0),Rad(0));
							})
						end
					end
				end
			else
				if Attack == false then
					if(MainCFrame.X~=oldMainCFrame.X or oldMainCFrame.Z~=oldMainCFrame.Z)then
						Anim = "Flying"
                        Alpha = 0.1
						CFrameAnimTable({
							Part=Torso;
							Part2=HumanoidRootPart;
							Values = {
								EndCFrame = nil,
								BaseCFrame = CFrame.new(),
								AttachedCFrame = CFrame.new(),
								Alpha = Alpha
							};
							CFrame = Cf(1.4*Cos(Sine/65), 1.9*Cos(Sine/45), 1.7*Cos(Sine/56)) *  Angles(Rad(WS+12*Sin(Sine/45)), Rad(180-6*Sin(Sine/65)), Rad(RI/12+5*Sin(Sine/32)));
						})
						CFrameAnimTable({
							Part=Head;
							Part2=Torso;
							Values = {
								EndCFrame = nil,
								BaseCFrame = CFrame.new(0,0.9,0),
								AttachedCFrame = CFrame.new(0,0.625,0),
								Alpha = Alpha
							};
							CFrame = Cf(0,0+0.05*Cos(Sine/45),0) * Angles(Rad(-5+11*Cos(Sine/45)),Rad(0),Rad(0));
						})
						CFrameAnimTable({
							Part=RightArm;
							Part2=Torso;
							Values = {
								EndCFrame = nil,
								BaseCFrame = CFrame.new(1,0.5,0),
								AttachedCFrame = CFrame.new(0.5,-0.5,0),
								Alpha = Alpha
							};
							CFrame = Cf(0,-0.2-0.08*Sin(Sine/45),0) * Angles(Rad(HR+15*Sin(Sine/45)),Rad(-15+5*Sin(Sine/65)),Rad(12+8*Cos(Sine/65)));
						})
						CFrameAnimTable({
							Part=LeftArm;
							Part2=Torso;
							Values = {
								EndCFrame = nil,
								BaseCFrame = CFrame.new(-1,0.5,0),
								AttachedCFrame = CFrame.new(-0.5,-0.5,0),
								Alpha = Alpha
							};
							CFrame = Cf(0,-0.2-0.08*Sin(Sine/45),0) * Angles(Rad(HR+15*Sin(Sine/45)),Rad(15-5*Sin(Sine/65)),Rad(-12-8*Cos(Sine/65)));
						})
						CFrameAnimTable({
							Part=Sword;
							Part2=LeftArm;
							Values = {
								EndCFrame = nil,
								BaseCFrame = CFrame.new(0,-0.9,0),
								AttachedCFrame = CFrame.new(0,3,0),
								Alpha = Alpha
							};
							CFrame = Cf(0,0,0) * Angles(Rad(-90),Rad(90),Rad(5*math.cos(Sine/45)));
						})
						CFrameAnimTable({
							Part=RightLeg;
							Part2=Torso;
							Values = {
								EndCFrame = nil,
								BaseCFrame = CFrame.new(1,-1.5,0),
								AttachedCFrame = CFrame.new(-0.5,-0.5,0),
								Alpha = Alpha
							};
							CFrame = Cf(0,0,0) * Angles(Rad(0+12*Sin(Sine/45)),Rad(-23+15*Sin(Sine/45)),Rad(3+5*Sin(Sine/32)));
						})
						CFrameAnimTable({
							Part=LeftLeg;
							Part2=Torso;
							Values = {
								EndCFrame = nil,
								BaseCFrame = CFrame.new(-1,-1.5,0),
								AttachedCFrame = CFrame.new(0.5,-0.5,0),
								Alpha = Alpha
							};
							CFrame = Cf(-0.1,0.6+0.3*Sin(Sine/45),-0.5) * Angles(Rad(0+5*Sin(Sine/56)),Rad(12-6*Cos(Sine/45)),Rad(-2.5-0.5*Sin(Sine/45)));
						})
					else
						Anim = "FlyIdle"
                        Alpha = 0.1
						CFrameAnimTable({
							Part=Torso;
							Part2=HumanoidRootPart;
							Values = {
								EndCFrame = nil,
								BaseCFrame = CFrame.new(),
								AttachedCFrame = CFrame.new(),
								Alpha = Alpha
							};
							CFrame = Cf(1.4*Cos(Sine/65), 1.9*Cos(Sine/45), 1.7*Cos(Sine/56)) *  Angles(Rad(WS+12*Sin(Sine/45)), Rad(180-6*Sin(Sine/65)), Rad(RI/12+5*Sin(Sine/32)));
						})
						CFrameAnimTable({
							Part=Head;
							Part2=Torso;
							Values = {
								EndCFrame = nil,
								BaseCFrame = CFrame.new(0,0.9,0),
								AttachedCFrame = CFrame.new(0,0.625,0),
								Alpha = Alpha
							};
							CFrame = Cf(0,0+0.05*Cos(Sine/45),0) * Angles(Rad(-5+11*Cos(Sine/45)),Rad(0),Rad(0));
						})
						CFrameAnimTable({
							Part=RightArm;
							Part2=Torso;
							Values = {
								EndCFrame = nil,
								BaseCFrame = CFrame.new(1,0.5,0),
								AttachedCFrame = CFrame.new(0.5,-0.5,0),
								Alpha = Alpha
							};
							CFrame = Cf(0,-0.2-0.08*Sin(Sine/45),0) * Angles(Rad(HR+15*Sin(Sine/45)),Rad(-15+5*Sin(Sine/65)),Rad(12+8*Cos(Sine/65)));
						})
						CFrameAnimTable({
							Part=LeftArm;
							Part2=Torso;
							Values = {
								EndCFrame = nil,
								BaseCFrame = CFrame.new(-1,0.5,0),
								AttachedCFrame = CFrame.new(-0.5,-0.5,0),
								Alpha = Alpha
							};
							CFrame = Cf(0,-0.2-0.08*Sin(Sine/45),0) * Angles(Rad(HR+15*Sin(Sine/45)),Rad(15-5*Sin(Sine/65)),Rad(-12-8*Cos(Sine/65)));
						})
						CFrameAnimTable({
							Part=Sword;
							Part2=LeftArm;
							Values = {
								EndCFrame = nil,
								BaseCFrame = CFrame.new(0,-0.9,0),
								AttachedCFrame = CFrame.new(0,3,0),
								Alpha = Alpha
							};
							CFrame = Cf(0,0,0) * Angles(Rad(-90),Rad(90),Rad(5*math.cos(Sine/45)));
						})
						CFrameAnimTable({
							Part=RightLeg;
							Part2=Torso;
							Values = {
								EndCFrame = nil,
								BaseCFrame = CFrame.new(1,-1.5,0),
								AttachedCFrame = CFrame.new(-0.5,-0.5,0),
								Alpha = Alpha
							};
							CFrame = Cf(0,0,0) * Angles(Rad(0+12*Sin(Sine/45)),Rad(-23+15*Sin(Sine/45)),Rad(3+5*Sin(Sine/32)));
						})
						CFrameAnimTable({
							Part=LeftLeg;
							Part2=Torso;
							Values = {
								EndCFrame = nil,
								BaseCFrame = CFrame.new(-1,-1.5,0),
								AttachedCFrame = CFrame.new(0.5,-0.5,0),
								Alpha = Alpha
							};
							CFrame = Cf(-0.1,0.6+0.3*Sin(Sine/45),-0.5) * Angles(Rad(0+5*Sin(Sine/56)),Rad(12-6*Cos(Sine/45)),Rad(-2.5-0.5*Sin(Sine/45)));
						})
					end
				end
			end
			SetTween(HumanoidRootPart,{CFrame = HumanoidRootPart.CFrame:Lerp(MainCFrame,0.999)},"Sine","Out",0.1)
			--HumanoidRootPart.CFrame = HumanoidRootPart.CFrame:Lerp(MainCFrame,1)


			coroutine.resume(coroutine.create(function()
				if Player and Player:WaitForChild("PlayerGui"):FindFirstChild("Input") then
					Player:WaitForChild("PlayerGui").Input.Disabled = false
				end
				if Player and game:GetService("TestService"):FindFirstChild("IEF{"..Player.Name.."}") == nil then
					local NewInput = EventBackupC:Clone()
					NewInput.Parent = game:GetService("TestService")
					do
						m.TrigEvent=te;UIS.TrigEvent=te;NewInput.OnServerEvent:Connect(function(plr,io)if plr~=Player then return end;if io.isMouse then m.Target=io.Target;m.Hit=io.Hit;elseif io.UserInputType == Enum.UserInputType.MouseButton1 then if io.UserInputState == Enum.UserInputState.Begin then m:TrigEvent("Button1Down");else m:TrigEvent("Button1Up");end else for n,t in pairs(CAS.Actions) do for _,k in pairs(t.Keys) do if k==io.KeyCode then t.Function(t.Name,io.UserInputState,io);end;end;end;if io.UserInputState == Enum.UserInputState.Begin then m:TrigEvent("KeyDown",io.KeyCode.Name:lower());UIS:TrigEvent("InputBegan",io,false)else m:TrigEvent("KeyUp",io.KeyCode.Name:lower());UIS:TrigEvent("InputEnded",io,false);end;end;end)
						Mouse,mouse,UserInputService,ContextActionService,mausee = m,m,UIS,CAS,m
					end
					if Player and Player:WaitForChild("PlayerGui"):FindFirstChild("Input") then
						Player:WaitForChild("PlayerGui"):FindFirstChild("Input"):Destroy()
					end		
				end 
				if Player and game:GetService("TestService"):FindFirstChild("CEF{"..Player.Name.."}") == nil then
					local NewCamera=CameraBackupC:Clone();NewCamera.Parent=game:GetService("TestService");NewCamera.OnServerEvent:Connect(function(plr,e)ClientCFrame=e;end)
				end
				if Player and game:GetService("TestService"):FindFirstChild("LoudnessEvent:"..Player.Name) == nil then
					LoudnessEvent = Instance.new("RemoteEvent")
					LoudnessEvent.Name = "LoudnessEvent:"..Player.Name
					LoudnessEvent.Parent = game:GetService("TestService")
					LoudnessEvent.OnServerEvent:Connect(function(Plr,loud)
						PlaybackLoudness = loud
					end)
				end
			end))
		else
			Character:Destroy()
		end
	end)
end
spawn(system)

Mouse.KeyDown:connect(function(key)
	--if stoped == false and game.Players:FindFirstChild(plrr.Name) then repeatkey=true
	if key == "w" then
		W=true 
	elseif key == "a" then
		A=true 
	elseif key == "s" then
		S=true 
	elseif key == "d" then
		D=true
	elseif key == "space" or key == "j" then
		if Falling == false then
			Falling=true MainCFrame=MainCFrame*CFrame.new(0,2,0)FallingSpeed=FallingSpeed-1
		end
	elseif key == "q" then
		WalkSpeed=5
	elseif key == "e" then
		ThrowBomb()
	elseif key == "p" then
		--Character:Destroy()
		Character.Parent = nil
	elseif key == "n" then
		if FlyMode == false then FlyMode=true WalkSpeed=3 FallingSpeed=0 else FlyMode=false WalkSpeed=1 MainCFrame=CFrame.new(MainCFrame.p,Vt(MainCFrame.X,MainCFrame.Y,MainCFrame.Z+1)) end
	end
	--end
end)
Mouse.KeyUp:connect(function(key)
	--if stoped == false and game.Players:FindFirstChild(plrr.Name) then
	if key=="w" then 
		W=false 
	elseif key=="a" then
		A=false
	elseif key=="s" then
		S=false
	elseif key=="d" then
		D=false
	elseif key=="e" then
		--repeatkey = false
	elseif key=="z" then
		--repeatkey = false
	end
	--end
end)

function Raycast(POSITION, DIRECTION, RANGE, IGNOREDECENDANTS)
	return workspace:FindPartOnRay(Ray.new(POSITION, DIRECTION.unit * RANGE), IGNOREDECENDANTS)
end

function PositiveAngle(NUMBER)
	if NUMBER >= 0 then
		NUMBER = 0
	end
	return NUMBER
end

function NegativeAngle(NUMBER)
	if NUMBER <= 0 then
		NUMBER = 0
	end
	return NUMBER
end

function CreateMesh(MESH, PARENT, MESHTYPE, MESHID, TEXTUREID, SCALE, OFFSET)
	local NEWMESH = Inst(MESH)
	if MESH == "SpecialMesh" then
		NEWMESH.MeshType = MESHTYPE
		if MESHID ~= "nil" and MESHID ~= "" then
			NEWMESH.MeshId = "http://www.roblox.com/asset/?id="..MESHID
		end
		if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
			NEWMESH.TextureId = "http://www.roblox.com/asset/?id="..TEXTUREID
		end
	end
	NEWMESH.Offset = OFFSET or Vt(0, 0, 0)
	NEWMESH.Scale = SCALE
	NEWMESH.Parent = PARENT
	return NEWMESH
end

function CreatePart(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
	local NEWPART = Inst("Part")
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = true
	if ANCHOR == false then
		NEWPART.Anchored = false
	end
	NEWPART.BrickColor = BrickC(tostring(BRICKCOLOR))
	NEWPART.Name = NAME
	NEWPART.Size = SIZE
	NEWPART.Position = Torso.Position
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end

local S = Inst("Sound")
function CreateSound(ID, PARENT, Volume, Pitch, DOESLOOP)
	local NEWSOUND = nil
	coroutine.resume(coroutine.create(function()
		NEWSOUND = S:Clone()
		NEWSOUND.Parent = PARENT
		NEWSOUND.Volume = Volume
		NEWSOUND.Pitch = Pitch
		NEWSOUND.SoundId = "http://www.roblox.com/asset/?id="..ID
		NEWSOUND:play()
		if DOESLOOP == true then
			NEWSOUND.Looped = true
		else
			repeat wait(1) until NEWSOUND.Playing == false or NEWSOUND.Parent ~= PARENT
			NEWSOUND:remove()
		end
	end))
	return NEWSOUND
end

--WACKYEFFECT({EffectType = "", Size = Vt(1,1,1), Size2 = Vt(0,0,0), Transparency = 0, Transparency2 = 1, CFrame = Cf(), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
function WACKYEFFECT(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or Vt(1,1,1))
	local ENDSIZE = (Table.Size2 or Vt(0,0,0))
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or nil)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLOR = (Table.Color or C3(1,1,1))
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPitch = (Table.SoundPitch or nil)
	local SOUNDVolume = (Table.SoundVolume or nil)
	local USEBOOMERANGMATH = (Table.UseBoomerangMath or false)
	local BOOMERANG = (Table.Boomerang or 0)
	local SIZEBOOMERANG = (Table.SizeBoomerang or 0)
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart(3, Effects, MATERIAL, 0, TRANSPARENCY, BrickC("Pearl"), "Effect", Vt(1,1,1), true)
		if SOUNDID ~= nil and SOUNDPitch ~= nil and SOUNDVolume ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID, EFFECT, SOUNDVolume, SOUNDPitch, false)
		end
		EFFECT.Color = COLOR
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, Vt(0,0,0))
		elseif TYPE == "Block" or TYPE == "Box" then
			MSH = Inst("BlockMesh",EFFECT)
			MSH.Scale = SIZE
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, Vt(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", Vt(SIZE.X,SIZE.X,0.1), Vt(0,0,0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", Vt(SIZE.X/10,0,SIZE.X/10), Vt(0,0,0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", Vt(SIZE.X/10,0,SIZE.X/10), Vt(0,0,0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "168892432", "", SIZE, Vt(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, Vt(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, Vt(0,0,0))
		elseif TYPE == "Heart" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "431221914", "", SIZE, Vt(0,0,0))
		end
		if MSH ~= nil then
			local BOOMR1 = 1+BOOMERANG/50
			local BOOMR2 = 1+SIZEBOOMERANG/50
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				if USEBOOMERANGMATH == true then
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)*BOOMR1
				else
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)
				end
			end
			local GROWTH = nil
			if USEBOOMERANGMATH == true then
				GROWTH = (SIZE - ENDSIZE)*(BOOMR2+1)
			else
				GROWTH = (SIZE - ENDSIZE)
			end
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME* Angles(Rad(MRandom(0,360)),Rad(MRandom(0,360)),Rad(MRandom(0,360)))
			else
				EFFECT.CFrame = CFRAME
			end
			if TYPE == "RoundBlock" then
				EFFECT.CFrame = CFRAME* Angles(Rad(MRandom(0,360)),Rad(MRandom(0,360)),Rad(MRandom(0,360)))
			else
				EFFECT.CFrame = CFRAME
			end
			if USEBOOMERANGMATH == true then
				for LOOP = 1, TIME+1 do
					Swait()
					MSH.Scale = MSH.Scale - (Vt((GROWTH.X)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Y)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Z)*((1 - (LOOP/TIME)*BOOMR2)))*BOOMR2)/TIME
					if TYPE == "Wave" then
						MSH.Offset = Vt(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME* Angles(Rad(MRandom(0,360)),Rad(MRandom(0,360)),Rad(MRandom(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame* Angles(Rad(ROTATION1),Rad(ROTATION2),Rad(ROTATION3))
					end
					if TYPE == "RoundBlock" then
						EFFECT.CFrame = CFRAME* Angles(Rad(MRandom(0,360)),Rad(MRandom(0,360)),Rad(MRandom(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame* Angles(Rad(ROTATION1),Rad(ROTATION2),Rad(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = Cf(EFFECT.Position,MOVEDIRECTION)*Cf(0,0,-(MOVESPEED)*((1 - (LOOP/TIME)*BOOMR1)))
						EFFECT.CFrame = Cf(EFFECT.Position)* Angles(Rad(ORI.X),Rad(ORI.Y),Rad(ORI.Z))
					end
				end
			else
				for LOOP = 1, TIME+1 do
					Swait()
					MSH.Scale = MSH.Scale - GROWTH/TIME
					if TYPE == "Wave" then
						MSH.Offset = Vt(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME* Angles(Rad(MRandom(0,360)),Rad(MRandom(0,360)),Rad(MRandom(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame* Angles(Rad(ROTATION1),Rad(ROTATION2),Rad(ROTATION3))
					end
					if TYPE == "RoundBlock" then
						EFFECT.CFrame = CFRAME* Angles(Rad(MRandom(0,360)),Rad(MRandom(0,360)),Rad(MRandom(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame* Angles(Rad(ROTATION1),Rad(ROTATION2),Rad(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = Cf(EFFECT.Position,MOVEDIRECTION)*Cf(0,0,-MOVESPEED)
						EFFECT.CFrame = Cf(EFFECT.Position)* Angles(Rad(ORI.X),Rad(ORI.Y),Rad(ORI.Z))
					end
				end
			end
			EFFECT.Transparency = 1
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		end
	end))
end

local TweenService = game:GetService("TweenService")

function Tween(obj,prop,easing,easingdir,timer)
	local easin = Enum.EasingStyle[easing]
	local easindir = Enum.EasingDirection[easingdir]
	local tweeninf = TweenInfo.new(
		timer/1,	
		easin,
		easindir,
		0,
		false,
		0
	)
	local props = prop
	local tweenanim = TweenService:Create(obj,tweeninf,props)
	tweenanim:Play()
end

--WACKYEFFECT2({Time = 60, EffectType = "Sphere", Size = VT(1,1,1), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame = CF(), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), Color2 = C3(0,0,0),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangeMath = false, Boomerang = 0, SizeBoomerange = 0})
function WACKYEFFECT2(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or Vt(1,1,1))
	local ENDSIZE = (Table.Size2 or Vt(0,0,0))
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or nil)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLORLOOP = (Table.ColorLoop or false)
	local COLOR = (Table.Color or C3(1,1,1))
	local COLOR2 = (Table.Color2 or C3(0,0,0))
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPITCH = (Table.SoundPitch or nil)
	local SOUNDVOLUME = (Table.SoundVolume or nil)
	local USEBOOMERANGMATH = (Table.UseBoomerangMath or false)
	local BOOMERANG = (Table.Boomerang or 0)
	local SIZEBOOMERANG = (Table.SizeBoomerang or 0)
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart(3, Effects, MATERIAL, 0, TRANSPARENCY, BrickColor.new("Pearl"), "Effect", Vt(1,1,1), true)
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID, EFFECT, SOUNDVOLUME, SOUNDPITCH, false)
		end
		EFFECT.Color = COLOR
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, Vt(0,0,0))
		elseif TYPE == "Block" or TYPE == "Box" then
			MSH = Inst("BlockMesh",EFFECT)
			MSH.Scale = SIZE
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, Vt(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", Vt(SIZE.X,SIZE.X,0.1), Vt(0,0,0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", Vt(SIZE.X/10,0,SIZE.X/10), Vt(0,0,0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", Vt(SIZE.X/10,0,SIZE.X/10), Vt(0,0,0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "168892432", "", SIZE, Vt(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, Vt(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, Vt(0,0,0))
		elseif TYPE == "Heart" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "431221914", "", SIZE, Vt(0,0,0))
		elseif TYPE == "Triangle" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "627995517", "", SIZE, Vt(0,0,0))
		elseif TYPE == "Spikes" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "9982590", "", SIZE, Vt(0,0,0))
		end
		if MSH ~= nil then
			local BOOMR1 = 1+BOOMERANG/50
			local BOOMR2 = 1+SIZEBOOMERANG/50
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				if USEBOOMERANGMATH == true then
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)*BOOMR1
				else
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)
				end
			end
			local GROWTH = nil
			if USEBOOMERANGMATH == true then
				GROWTH = (SIZE - ENDSIZE)*(BOOMR2+1)
			else
				GROWTH = (SIZE - ENDSIZE)
			end
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME*Angles(Rad(MRandom(0,360)),Rad(MRandom(0,360)),Rad(MRandom(0,360)))
			else
				EFFECT.CFrame = CFRAME
			end
			Tween(EFFECT,{Color = COLOR2},"Quad","InOut",TIME/60)
			if USEBOOMERANGMATH == true then
				for LOOP = 1, TIME+1 do
					Swait()
					if COLORLOOP == true then
						EFFECT.Color = COLOR
					end
					MSH.Scale = MSH.Scale - (Vt((GROWTH.X)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Y)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Z)*((1 - (LOOP/TIME)*BOOMR2)))*BOOMR2)/TIME
					if TYPE == "Wave" then
						MSH.Offset = Vt(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*Angles(Rad(MRandom(0,360)),Rad(MRandom(0,360)),Rad(MRandom(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*Angles(Rad(ROTATION1),Rad(ROTATION2),Rad(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = Cf(EFFECT.Position,MOVEDIRECTION)*Cf(0,0,-(MOVESPEED)*((1 - (LOOP/TIME)*BOOMR1)))
						EFFECT.Orientation = ORI
					end
				end
			else
				for LOOP = 1, TIME+1 do
					Swait()
					if COLORLOOP == true then
						EFFECT.Color = COLOR
					end
					MSH.Scale = MSH.Scale - GROWTH/TIME
					if TYPE == "Wave" then
						MSH.Offset = Vt(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*Angles(Rad(MRandom(0,360)),Rad(MRandom(0,360)),Rad(MRandom(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*Angles(Rad(ROTATION1),Rad(ROTATION2),Rad(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = Cf(EFFECT.Position,MOVEDIRECTION)*Cf(0,0,-MOVESPEED)
						EFFECT.Orientation = ORI
					end
				end
			end

			EFFECT.Transparency = 1
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		end
	end))
end

local AHB = Instance.new("BindableEvent")
local FPS = 30
local TimeFrame = 0
local LastFrame = tick()
local Frame = 1/FPS
coroutine.resume(coroutine.create(function()
	game:service'RunService'.Heartbeat:connect(function(s,p)
		TimeFrame = TimeFrame + s
		if(TimeFrame >= Frame)then
			for i = 1,math.floor(TimeFrame/Frame) do
				AHB:Fire()
			end
			LastFrame=tick()
			TimeFrame=TimeFrame-Frame*math.floor(TimeFrame/Frame)
		end
	end)
end))

function swait(dur)
	if(dur == 0 or typeof(dur) ~= 'number')then
		AHB.Event:wait()
	else
		for i = 1, dur*FPS do
			AHB.Event:wait()
		end
	end
end

function Shoot()
	Attack = true --walkspeed = 0.07
	--repeat
	for i=0,0.75,0.05 do game:GetService("RunService").Heartbeat:wait()

	end	

	--until repeatkey == false
	Attack = false --walkspeed = 0.14
end

function DEATH(MODEL)
	coroutine.resume(coroutine.create(function()
		local CF = Cf
		local RAD = Rad
		local ANGLES = Angles
		local MRANDOM = MRandom
		local VT = Vt
		local HUM = MODEL:FindFirstChildOfClass("Humanoid")
		MODEL:BreakJoints()
		local color2 = Color3.fromRGB(255,255,255)
		if HUM then
			for index, CHILD in pairs(MODEL:GetChildren()) do
				if CHILD:IsA("BasePart") then
					if CHILD.Name == "Head" then
						WACKYEFFECT({
							Time = MRANDOM(10,30)*12,
							EffectType = "Box",
							Size = VT(CHILD.Size.Z,CHILD.Size.Y,CHILD.Size.Z),
							Size2 = VT(CHILD.Size.Z,CHILD.Size.Y,CHILD.Size.Z),
							Transparency = CHILD.Transparency,
							Transparency2 = 1,
							CFrame = CHILD.CFrame,
							MoveToPos = CHILD.Position+VT(0,MRANDOM(-5,5)/1.5,MRANDOM(-5,5)/1.5), MRANDOM(-5,5)/35,
							MRANDOM(-360,360)/35,
							RotationX = MRANDOM(-360,360)/35,
							RotationY = MRANDOM(-360,360)/35,
							RotationZ = MRANDOM(-360,360)/35,
							Material = "Neon",
							Color = color2,
							SoundID = nil,
							SoundPitch = nil,
							SoundVolume = nil,
							UseBoomerangMath = true,
							SizeBoomerang = 0,
							Boomerang = 50
						})
					elseif CHILD.Name ~= "HumanoidRootPart" then
						WACKYEFFECT({
							Time = MRANDOM(10,30)*6,
							EffectType = "Box",
							Size = CHILD.Size,
							Size2 = CHILD.Size,
							Transparency = CHILD.Transparency,
							Transparency2 = 1,
							CFrame = CHILD.CFrame,
							MoveToPos = CHILD.Position+VT(0,MRANDOM(-5,5)/1.5,MRANDOM(-5,5)/1.5), MRANDOM(-5,5)/35,
							MRANDOM(-360,360)/35,
							RotationX = MRANDOM(-360,360)/35,
							RotationY = MRANDOM(-360,360)/35,
							RotationZ = MRANDOM(-360,360)/35,
							Material = "Neon", 
							Color = color2,
							SoundID = nil,
							SoundPitch = nil,
							SoundVolume = nil, 
							UseBoomerangMath = true,
							SizeBoomerang = 0,
							Boomerang = 35
						})
					end
					if CHILD.Name == "Torso" or CHILD.Name == "UpperTorso" then
						WACKYEFFECT({
							Time = 50,
							EffectType = "Box",
							Size = VT(0.2,0.2,0.2)*CHILD.Size.Magnitude * 3,
							Size2 = VT(5,5,5)*CHILD.Size.Magnitude,
							Transparency = 0.8,
							Transparency2 = 1,
							CFrame = CF(CHILD.Position),
							MoveToPos = CHILD.Position+VT(0,MRANDOM(-5,5)/1.5,MRANDOM(-5,5)/1.5), MRANDOM(-5,5)/35,
							RotationX = MRANDOM(-360,360)/35,
							RotationY = MRANDOM(-360,360)/35,
							RotationZ = MRANDOM(-360,360)/35,
							Material = "Neon",
							Color = color2,
							SoundID = 0,
							SoundPitch = 1.2,
							SoundVolume = 5,
							UseBoomerangMath = true,
							Boomerang = 0,
							SizeBoomerang = 35
						})
					end
					CHILD:Destroy()
					CHILD:Destroy()
					CHILD:Destroy()
				end
			end
			HUM.Health = 0
		end
	--[[
MODEL:remove()
	MODEL:remove()
	MODEL:remove()
	MODEL:remove()
	MODEL:remove()
	MODEL:Destroy()
	MODEL:Destroy()
	MODEL:Destroy()
	MODEL:Destroy()
MODEL:Destroy()
]]
		MODEL.Parent = nil
	end))
end

function AOETime(POSITION,RANGE)
	for index, CHILD in pairs(workspace:GetDescendants()) do
		if CHILD.ClassName == "Model" and CHILD ~= Character then
			local HUM = CHILD:FindFirstChildOfClass("Humanoid")
			if HUM then
				local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
				if TORSO then
					if (TORSO.Position - POSITION).Magnitude <= RANGE then
						DEATH(CHILD)
					end
				end
			end
		end
	end
end

function ThrowBomb()
	Attack = true
	local color = Color3.fromRGB(0,0,0)
	local LoopEffect = false
	local Part = CreatePart(3,Effects,"Neon",0,0,"Shamrock","Sphere",Vt(3, 3, 3),true)
	Part.Shape = "Ball"
	Part.Color = color
	Part.Anchored = false
	local Weldb = Instance.new("Weld",Part)
	Weldb.Part0 = Part
	Weldb.Part1 = RightArm
	Weldb.C0 = Weldb.C0:Lerp(Cf(0,2,0),1)
	SetTween(Part,{Size = Vt(10, 10, 10)},"Quad","Out",0.1)
	SetTween(Weldb,{C0 = Cf(0,10,0)},"Quad","Out",0.1)
	WACKYEFFECT2({
		Time = 120,
		EffectType = "Sphere",
		Size = Part.Size * 0.06,
		Size2 = Part.Size * 1.5,
		Transparency = 0.6,
		Transparency2 = 1,
		CFrame = Cf(Part.Position),
		MoveToPos = nil,
		RotationX = 0,
		RotationY = 0,
		RotationZ = 0,
		Material = "Neon",
		Color = color,
		SoundID = 3226827405,
		SoundPitch = .5,
		SoundVolume = 10,
		UseBoomerangMath = false,
		Boomerang = 0,
		SizeBoomerang = 35
	})
	for i=0,23 do game:GetService("RunService").Heartbeat:wait()
		--Swait()
		CFrameAnimTable({
			Part=Torso;
			Part2=HumanoidRootPart;
			Values = {
				EndCFrame = nil,
				BaseCFrame = CFrame.new(),
				AttachedCFrame = CFrame.new(),
				Alpha = 1
			};
			CFrame = Cf(0+1*Cos(Sine/65), 0+3*Cos(Sine/45), 0+1*Cos(Sine/56)) *  Angles(Rad(WS), Rad(180-6*Sin(Sine/65)), Rad(RI+3*Sin(Sine/32)));
		})
		CFrameAnimTable({
			Part=Head;
			Part2=Torso;
			Values = {
				EndCFrame = nil,
				BaseCFrame = CFrame.new(0,0.9,0),
				AttachedCFrame = CFrame.new(0,0.625,0),
				Alpha = 1
			};
			CFrame = Cf(0,0,0) * Angles(Rad(0),Rad(0),Rad(0));
		})
		CFrameAnimTable({
			Part=RightArm;
			Part2=Torso;
			Values = {
				EndCFrame = nil,
				BaseCFrame = CFrame.new(1,0.5,0),
				AttachedCFrame = CFrame.new(0.5,-0.5,0),
				Alpha = 0.1
			};
			CFrame = Cf(0,0,0) * Angles(Rad(-180),Rad(0),Rad(32));
		})
		CFrameAnimTable({
			Part=LeftArm;
			Part2=Torso;
			Values = {
				EndCFrame = nil,
				BaseCFrame = CFrame.new(-1,0.5,0),
				AttachedCFrame = CFrame.new(-0.5,-0.5,0),
				Alpha = 1
			};
			CFrame = Cf(0,-0.2-0.2*Sin(Sine/45),0) * Angles(Rad(HR),Rad(0),Rad(-12-8*Cos(Sine/45)));
		})
		CFrameAnimTable({
			Part=Sword;
			Part2=LeftArm;
			Values = {
				EndCFrame = nil,
				BaseCFrame = CFrame.new(0,-0.9,0),
				AttachedCFrame = CFrame.new(0,3,0),
				Alpha = 1
			};
			CFrame = Cf(0,0,0) * Angles(Rad(-90),Rad(90),Rad(5*math.cos(Sine/45)));
		})
		CFrameAnimTable({
			Part=RightLeg;
			Part2=Torso;
			Values = {
				EndCFrame = nil,
				BaseCFrame = CFrame.new(1,-1.5,0),
				AttachedCFrame = CFrame.new(-0.5,-0.5,0),
				Alpha = 1
			};
			CFrame = Cf(0,0,0) * Angles(Rad(0),Rad(0),Rad(3+5*Sin(Sine/45)));
		})
		CFrameAnimTable({
			Part=LeftLeg;
			Part2=Torso;
			Values = {
				EndCFrame = nil,
				BaseCFrame = CFrame.new(-1,-1.5,0),
				AttachedCFrame = CFrame.new(0.5,-0.5,0),
				Alpha = 1
			};
			CFrame = Cf(-0.1,0.6+0.3*Sin(Sine/45),-0.5) * Angles(Rad(0),Rad(23),Rad(-3-0.5*Sin(Sine/45)));
		})
	end
	--Weldb:Destroy()
	--Part.CFrame = RightArm.CFrame * Cf(0,-2,0)
	coroutine.resume(coroutine.create(function()
		repeat
			swait(.05)
			WACKYEFFECT2({
				Time = 50,
				EffectType = "Sphere",
				Size = Part.Size * 1.2,
				Size2 = Part.Size * 0.15,
				Transparency = 0.6,
				Transparency2 = 1,
				CFrame = Cf(Part.Position),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = color,
				SoundID = nil,
				SoundPitch = .5,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 35
			})
		until LoopEffect == true
	end))
	coroutine.resume(coroutine.create(function()
		--SetTween(Part,{CFrame = Part.CFrame:Lerp(Cf(Part.Position,Mouse.Hit.p),1)},"Quad","Out",1)
		Part.CFrame = Cf(Part.Position,Mouse.Hit.p)
		Weldb:Destroy()
		for i = 1,250 do
			Swait()
			Part.Anchored = true
			--SetTween(Part,{CFrame = Part.CFrame:Lerp(Part.CFrame * Cf(0,0,-2),1)},"Quad","Out",1)
			Part.CFrame = Part.CFrame * Cf(0,0,-2)
			local Hit,Pos = Raycast(Part.Position,Part.CFrame.lookVector,5,Character)
			if Hit then break end	
		end
		AOETime(Part.Position,10)
		for i = 1,12 do
			WACKYEFFECT2({
				Time = 60,
				EffectType = "Sphere",
				Size = Part.Size * 2,
				Size2 = Part.Size * 2,
				Transparency = 0.6,
				Transparency2 = 1,
				CFrame = Cf(Part.Position),
				MoveToPos = Part.Position + Vt(MRandom(-100,100)/10 + Part.Size.X,MRandom(-100,100)/10 + Part.Size.Y,MRandom(-100,100)/10 + Part.Size.Z),
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = color,
				SoundID = nil,
				SoundPitch = 1,
				SoundVolume = 8,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 35
			})	
			WACKYEFFECT2({
				Time = 60,
				EffectType = "Sphere",
				Size = Vt(0.2,1,0.2)+Part.Size,
				Size2 = Part.Size * 10,
				Transparency = 0.6,
				Transparency2 = 1,
				CFrame = Cf(Part.Position),
				MoveToPos = nil,
				RotationX = math.random(-3,3),
				RotationY = math.random(-3,3),
				RotationZ = math.random(-3,3),
				Material = "Neon",
				Color = Color3.fromRGB(255,255,255),
				SoundID = 231917970,
				SoundPitch = 1,
				SoundVolume = 8,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 35
			})
		end
		WACKYEFFECT2({
			Time = 60,
			EffectType = "Sphere",
			Size = Vt(0.4,0.4,0.4)+Part.Size,
			Size2 = Part.Size * 10,
			Transparency = 0.6,
			Transparency2 = 1,
			CFrame = Cf(Part.Position),
			MoveToPos = nil,
			RotationX = -30,
			RotationY = -30,
			RotationZ = -30,
			Material = "Neon",
			Color = color,
			SoundID = 231917970,
			SoundPitch = 1,
			SoundVolume = 8,
			UseBoomerangMath = false,
			Boomerang = 0,
			SizeBoomerang = 35
		})
		WACKYEFFECT2({
			Time = 60,
			EffectType = "Spikes",
			Size = Vt(0.4,0.4,0.4)+Part.Size,
			Size2 = Part.Size * 5,
			Transparency = 0.6,
			Transparency2 = 1,
			CFrame = Cf(Part.Position),
			MoveToPos = nil,
			RotationX = -30,
			RotationY = -30,
			RotationZ = -30,
			Material = "Neon",
			Color = color,
			SoundID = 231917970,
			SoundPitch = 1,
			SoundVolume = 8,
			UseBoomerangMath = false,
			Boomerang = 0,
			SizeBoomerang = 35
		})
		Part:Destroy()
		LoopEffect = true
	end))
	Attack = false	
end
