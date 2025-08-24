local R=loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local W=R:CreateWindow({Name="solex",Icon=0,LoadingTitle="solex",LoadingSubtitle="by soldix",ShowText="solex",Theme="Amber Glow",ToggleUIKeybind="K",DisableRayfieldPrompts=false,DisableBuildWarnings=false,ConfigurationSaving={Enabled=true,FileName="solex"},Discord={Enabled=true,Invite="R26JXcq3pB",RememberJoins=true},KeySystem=true,KeySettings={Title="solex",Subtitle="key system",Note="go join server for the key --> https://discord.gg/R26JXcq3pB",FileName="SolexKey",SaveKey=true,GrabKeyFromSite=false,Key={"SolexKey"}}})
local M=W:CreateTab("main",4483362458)
local P,U,V=game.Players.LocalPlayer,game.Players.LocalPlayer:GetMouse(),false
local function A()local t,l=nil,math.huge;for _,p in pairs(game.Players:GetPlayers())do if p~=P and p.Character and p.Character.PrimaryPart then local d=p.Character.PrimaryPart.Position if (d-U.Hit.p).Magnitude<l then l=(d-U.Hit.p).Magnitude;t=p end end end;if t and t.Character and t.Character.PrimaryPart then game.Workspace.CurrentCamera.CFrame=CFrame.new(game.Workspace.CurrentCamera.CFrame.Position,t.Character.PrimaryPart.Position)end end
game:GetService("RunService").RenderStepped:Connect(function()if V then A()end end)
M:CreateButton({Name="aimbot or camlock idk what to call it",Callback=function()V=not V end})
local O=W:CreateTab("others",4483362458)
O:CreateSlider({Name="vroom vroom",Range={16,200},Increment=1,Suffix="Speed",CurrentValue=16,Callback=function(x)if P.Character and P.Character:FindFirstChild("Humanoid")then P.Character.Humanoid.WalkSpeed=x end end})
O:CreateSlider({Name="jump defices laws of pyshics now",Range={50,300},Increment=1,Suffix="Power",CurrentValue=50,Callback=function(x)if P.Character and P.Character:FindFirstChild("Humanoid")then P.Character.Humanoid.JumpPower=x end end})
O:CreateSlider({Name="spin speed",Range={0,100},Increment=1,Suffix="°/f",CurrentValue=0,Flag="SpinBot",Callback=function(x)if _G.SpinConnection then _G.SpinConnection:Disconnect() end;local c=P.Character or P.CharacterAdded:Wait();local h=c:WaitForChild("HumanoidRootPart");local R=game:GetService("RunService");if x>0 then _G.SpinConnection=R.RenderStepped:Connect(function()if h.Parent then h.CFrame=h.CFrame*CFrame.Angles(0,math.rad(x),0)end end)end end})
O:CreateButton({Name="invite ur friends to discord :)",Callback=function()setclipboard("https://discord.gg/R26JXcq3pB")end})
local E=W:CreateTab("esp",4483362458)
local PL,RS,LP=game:GetService("Players"),game:GetService("RunService"),game.Players.LocalPlayer
local EE=false
local MD,SB={},1000,true
local function CE(p)if not p.Character or not p.Character:FindFirstChild("HumanoidRootPart")then return end;local hr=p.Character.HumanoidRootPart;local b; if SB then b=Instance.new("BoxHandleAdornment");b.Adornee=hr;b.AlwaysOnTop=true;b.Size=Vector3.new(2,5,1);b.Parent=hr end;local n=Instance.new("BillboardGui");n.Adornee=hr;n.Size=UDim2.new(0,100,0,50);n.StudsOffset=Vector3.new(0,3,0);n.AlwaysOnTop=true;n.Parent=hr;local l=Instance.new("TextLabel");l.Size=UDim2.new(1,0,1,0);l.BackgroundTransparency=1;l.TextStrokeTransparency=0;l.TextScaled=true;l.Font=Enum.Font.GothamBold;l.Text=p.Name;l.Parent=n;SB[p]={Box=b,NameTag=n}end
local function RE(p)if SB[p]then for _,v in pairs(SB[p])do if v then v:Destroy()end end;SB[p]=nil end end
E:CreateToggle({Name="see ppl thru walls",CurrentValue=false,Flag="ESP_Toggle",Callback=function(vv)EE=vv;if not EE then for _,p in pairs(PL:GetPlayers())do RE(p)end end end})
E:CreateSlider({Name="range",Range={50,2000},Increment=50,Suffix="studs",CurrentValue=MD,Flag="ESP_Distance",Callback=function(vv)MD=vv end})
E:CreateToggle({Name="Show Boxes",CurrentValue=true,Flag="ESP_ShowBoxes",Callback=function(vv)SB=vv;for _,p in pairs(PL:GetPlayers())do RE(p)end end})
RS.RenderStepped:Connect(function()if not EE then return end;local c=LP.Character;if not c or not c:FindFirstChild("HumanoidRootPart")then return end;local cp=c.HumanoidRootPart.Position;for _,p in pairs(PL:GetPlayers())do if p~=LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart")then local hr=p.Character.HumanoidRootPart;local dist=(cp-hr.Position).Magnitude;if dist<=MD then if not SB[p]then CE(p)end;if SB[p].NameTag then SB[p].NameTag.TextLabel.Text=p.Name.." ["..math.floor(dist).." studs]"end else RE(p)end else RE(p)end end end)
PL.PlayerRemoving:Connect(function(p)RE(p)end)
