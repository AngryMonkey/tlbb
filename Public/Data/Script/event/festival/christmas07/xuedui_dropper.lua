--2007圣诞元旦活动....
--圣诞守夜活动....

--散落雪堆脚本....
--用于在活动期间....每天双数点时在洛阳随机散落雪堆....


--脚本号
x050024_g_ScriptId	= 050024

x050024_g_PosTbl = {

	{{147,129},{140,129},{132,129}},
	{{125,129},{118,129},{112,129}},
	{{105,129},{ 98,129},{ 92,129}},
	{{ 86,129},{ 80,129},{ 74,130}},
	{{ 67,130},{ 61,127},{ 58,144}},
	{{ 66,147},{ 63,143},{ 60,140}},
	{{ 67,139},{ 76,139},{ 84,139}},
	{{ 92,139},{101,139},{107,139}},
	{{111,142},{117,139},{127,138}},
	{{134,138},{143,139},{177,139}},
	{{183,130},{188,139},{192,129}},
	{{201,139},{200,129},{210,129}},
	{{211,138},{216,139},{213,129}},
	{{219,129},{224,138},{235,138}},
	{{243,138},{250,139},{257,138}},
	{{258,144},{253,144},{249,149}},
	{{232,113},{237,113},{223,149}},
	{{240,150},{240,156},{223,161}},
	{{207,151},{215,151},{215,158}},
	{{222,171},{225,178},{233,184}},
	{{193,149},{200,153},{196,161}},
	{{200,168},{196,172},{196,180}},
	{{208,175},{209,182},{203,183}},
	{{208,189},{199,199},{209,200}},
	{{186,199},{173,200},{163,200}},
	{{153,199},{165,183},{157,180}},
	{{154,173},{151,182},{165,174}},
	{{165,166},{167,156},{155,168}},
	{{153,157},{144,182},{138,180}},
	{{132,180},{129,186},{123,179}},
	{{121,185},{108,184},{115,176}},
	{{108,173},{108,167},{117,169}},
	{{115,158},{107,154},{115,148}},
	{{109,199},{112,210},{ 99,173}},
	{{ 81,170},{ 82,194},{ 99,195}},
	{{ 90,194},{ 81,153},{ 86,149}},
	{{ 96,154},{ 84,115},{ 90,106}},
	{{ 77,106},{ 91,120},{ 58,106}},
	{{ 57, 98},{ 48, 82},{ 58, 75}},
	{{ 50, 53},{ 50, 61},{ 68, 64}},
	{{ 74, 47},{ 38, 40},{ 39, 66}},
	{{ 76, 36},{ 93, 37},{ 99, 33}},
	{{118, 33},{125, 38},{143, 38}},
	{{162, 38},{178, 32},{183, 38}},
	{{196, 31},{214, 34},{231, 37}},
	{{215, 48},{193, 69},{206, 69}},
	{{215, 65},{188, 58},{199, 47}},
	{{228, 52},{246, 52},{247, 38}},
	{{265, 38},{274, 41},{274, 55}},
	{{258, 56},{251, 63},{275, 70}}

}

x050024_g_IDXLastGiveTime	= 0


--**********************************
--脚本入口函数
--**********************************
function x050024_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--检测是否是活动时间....
	if 0 == x050024_CheckActivityTime() then
		return
	end

	--开启活动....
	StartOneActivity( sceneId, actId, 5*60*1000, iNoticeType )
	SetActivityParam( sceneId, actId, x050024_g_IDXLastGiveTime, 0 )

end

--**********************************
--心跳函数
--**********************************
function x050024_OnTimer( sceneId, actId, uTime )

	--检测活动是否过期....
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
		return
	end

	--begin modified by zhangguoxin 090207
	--local CurHourTime = GetHourTime()
	local CurHourTime = GetQuarterTime()

	--特例: 2007-12-24 10:00 之前不允许散落雪堆....
	
	--if 2008 == LuaFnGetThisYear() and CurHourTime < 72340 then
	if 2008 == LuaFnGetThisYear() and CurHourTime < 835840 then
		return
	end
	--begin modified by zhangguoxin 090207

	--每双数点散落雪堆....
	local QTime = mod(CurHourTime,100)
	if mod(QTime,8) ~= 0 then
		return
	end

	local LastGiveTime = GetActivityParam( sceneId, actId, x050024_g_IDXLastGiveTime )
	if CurHourTime > LastGiveTime then
		x050024_GiveXueDui( sceneId )
		SetActivityParam( sceneId, actId, x050024_g_IDXLastGiveTime, CurHourTime )
	end

end

--**********************************
--检测当前是否是活动时间
--**********************************
function x050024_CheckActivityTime()

	--2008-12-24 ~ 2009-1-8

	local curDayTime = GetDayTime()
	if curDayTime >= 8358 and curDayTime < 9007 then
		return 1
	end

	return 0

end

--**********************************
--散落雪堆
--**********************************
function x050024_GiveXueDui( sceneId )

	local idx = 1
	local ItemBoxId = -1
	local Pos = nil

	for _, PosGroup in x050024_g_PosTbl do

		idx = random(3)
		Pos = PosGroup[idx]

		ItemBoxId = ItemBoxEnterScene( Pos[1], Pos[2], 778, sceneId, QUALITY_MUST_BE_CHANGE, 1, 30505146 )
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 30501106 )

		local rand = random(100)
		if rand < 20 then
			AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 30505146 )
		end
		rand = random(100)
		if rand < 33 then
			AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 30501106 )
		end
		
		SetItemBoxMaxGrowTime( sceneId, ItemBoxId, 5400000 )

	end

end
