local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer

local BlurEffect = Instance.new("BlurEffect")
BlurEffect.Parent = workspace.CurrentCamera
BlurEffect.Enabled = true
local BR_DEFAULT_SIZE = 0
BlurEffect.Size = 0

local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
ColorCorrectionEffect.Parent = workspace.CurrentCamera
ColorCorrectionEffect.Enabled = true
local CC_DEFAULT_BRIGHTNESS = 0
local CC_DEFAULT_CONTRAST = 0.2
local CC_DEFAULT_SATURATION = 0.1
local CC_DEFAULT_TINT_COLOR = Color3.fromRGB(251, 255, 206)
ColorCorrectionEffect.Brightness = CC_DEFAULT_BRIGHTNESS
ColorCorrectionEffect.Contrast = CC_DEFAULT_CONTRAST
ColorCorrectionEffect.Saturation = CC_DEFAULT_SATURATION
ColorCorrectionEffect.TintColor = CC_DEFAULT_TINT_COLOR


local DepthOfFieldEffect = Instance.new("DepthOfFieldEffect")
DepthOfFieldEffect.Parent = workspace.CurrentCamera
DepthOfFieldEffect.Enabled = true
local DOF_DEFAULT_FAR_INTENSITY = 0.22
local DOF_DEFAULT_FOCUS_DISTANCE = 200
local DOF_DEFAULT_IN_FOCUS_RADIUS = 50
local DOF_DEFAULT_NEAR_INTENSITY = 0
DepthOfFieldEffect.FarIntensity = DOF_DEFAULT_FAR_INTENSITY
DepthOfFieldEffect.FocusDistance = DOF_DEFAULT_FOCUS_DISTANCE
DepthOfFieldEffect.InFocusRadius = DOF_DEFAULT_IN_FOCUS_RADIUS
DepthOfFieldEffect.NearIntensity = DOF_DEFAULT_NEAR_INTENSITY

local SunRaysEffect = Instance.new("SunRaysEffect")
SunRaysEffect.Parent = workspace.CurrentCamera
SunRaysEffect.Enabled = true
local SR_DEFAULT_INTENSITY = 0.035
local SR_DEFAULT_SPREAD = 0.4
SunRaysEffect.Intensity = SR_DEFAULT_INTENSITY
SunRaysEffect.Spread = SR_DEFAULT_SPREAD

local BloomEffect = Instance.new("BloomEffect")
BloomEffect.Parent = workspace.CurrentCamera
BloomEffect.Enabled = true
local BM_DEFAULT_BLOOM_INTENSITY = 0.5
local BM_DEFAULT_BLOOM_SIZE = 50
local BM_DEFAULT_BLOOM_THRESHHOLD = 0.8
BloomEffect.Intensity = BM_DEFAULT_BLOOM_INTENSITY
BloomEffect.Size = BM_DEFAULT_BLOOM_SIZE
BloomEffect.Threshold = BM_DEFAULT_BLOOM_THRESHHOLD


local DEATH_EFFECT_DELAY = 0 --seconds
local DEATH_EFFECT_DURATION = 6  --seconds
local DEATH_TINT_COLOR = Color3.fromRGB(200, 45, 45)
local DEATH_BLUR_INTENSITY = 56

local deathEffectInfo = TweenInfo.new(
	DEATH_EFFECT_DURATION,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.Out,
	0,
	false,
	DEATH_EFFECT_DELAY)


local tweenBlurGoal = {
	Size = DEATH_BLUR_INTENSITY,
}

local tweenColorGoal = {
	TintColor = DEATH_TINT_COLOR
}

local tweenBlur = TweenService:Create(BlurEffect, deathEffectInfo, tweenBlurGoal)
local tweenColor = TweenService:Create(ColorCorrectionEffect, deathEffectInfo, tweenColorGoal)

local function playDeathTween()
	tweenBlur:Play()
	tweenColor:Play()
end

local function setupDeathTween(character)

	local humanoid = character:WaitForChild("Humanoid")

	if tweenBlur and tweenBlur.PlaybackState == Enum.PlaybackState.Playing then
		tweenBlur:Cancel()
		tweenColor:Cancel()
	end


	BlurEffect.Size = BR_DEFAULT_SIZE
	ColorCorrectionEffect.Brightness = CC_DEFAULT_BRIGHTNESS
	ColorCorrectionEffect.Contrast = CC_DEFAULT_CONTRAST
	ColorCorrectionEffect.Saturation = CC_DEFAULT_SATURATION
	ColorCorrectionEffect.TintColor = CC_DEFAULT_TINT_COLOR
	BloomEffect.Intensity = BM_DEFAULT_BLOOM_INTENSITY
	BloomEffect.Size = BM_DEFAULT_BLOOM_SIZE
	BloomEffect.Threshold = BM_DEFAULT_BLOOM_THRESHHOLD
	DepthOfFieldEffect.FarIntensity = DOF_DEFAULT_FAR_INTENSITY
	DepthOfFieldEffect.FocusDistance = DOF_DEFAULT_FOCUS_DISTANCE
	DepthOfFieldEffect.InFocusRadius = DOF_DEFAULT_IN_FOCUS_RADIUS
	DepthOfFieldEffect.NearIntensity = DOF_DEFAULT_NEAR_INTENSITY
	SunRaysEffect.Intensity = SR_DEFAULT_INTENSITY
	SunRaysEffect.Spread = SR_DEFAULT_SPREAD


	humanoid.Died:Connect(function()
		playDeathTween()
	end)
end


Player.CharacterAdded:Connect(setupDeathTween)

if Player.Character then
	setupDeathTween(Player.Character or Player.CharacterAdded:Wait())
end

