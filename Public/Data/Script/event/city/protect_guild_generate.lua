--保护帮派

--脚本号
x805041_g_ScriptId	= 805041

x805041_g_scenePosInfoList = {
			{x=77,	z=136},
			{x=52,	z=130},
			{x=61,	z=144},
			{x=82,	z=142},
			{x=84,	z=150},
			{x=115,	z=150},
			{x=123,	z=152},
			{x=121,	z=137},
			{x=131,	z=128},
			{x=141,	z=128},
			{x=143,	z=143},
			{x=103,	z=145},
			{x=95,	z=122},
			{x=107,	z=119},
			{x=85,	z=103},
			{x=72,	z=89},
			{x=55,	z=93},
			{x=56,	z=81},
			{x=45,	z=68},
			{x=45,	z=51},
			{x=55,	z=56},
			{x=68,	z=61},
			{x=89,	z=54},
			{x=99,	z=58},
			{x=110,	z=53},
			{x=129,	z=52},
			{x=145,	z=50},
			{x=150,	z=67},
			{x=146,	z=89},
			{x=125,	z=97},
			{x=104,	z=98},
			{x=100,	z=91},
			{x=99,	z=80},
			{x=110,	z=69},
			{x=88,	z=68},
			{x=81,	z=68},
			{x=100,	z=75},
			{x=134,	z=69},
			{x=60,	z=89},
			{x=144,	z=88},
		}



x805041_g_TimeIndex			=	0
x805041_g_NoticeTick		=	1
x805041_g_MonsterGroup		=	2

function x805041_InList( Data, List )
    for i, Element in List do
        if Element == Data then
            return 1
        end
    end

    return 0    
end

function x805041_GetValidIndex( PosList, IndexList )
    local PosListSize = getn( PosList )
    local IndexListSize = getn( IndexList )
    
    if IndexListSize >= PosListSize then
    	return
    end
    
    local rNum = random( PosListSize -  IndexListSize )
    
    local Data = 1
    local bFind = 0
    while bFind == 0 do      
        local bInList = x805041_InList( Data, IndexList )
        if  bInList == 0  then
        	if rNum > 0 then
        		rNum = rNum - 1;
        	else
        		IndexList[ IndexListSize + 1 ] = Data
        		bFind = 1
        	end
        end
        
		Data = (Data + 1)
        if Data > PosListSize then
        	Data = 1
        end
    end
end


function x805041_CollectIndex( PosList, IndexList, IndexListSize )
    for i=1, IndexListSize do
        x805041_GetValidIndex( PosList, IndexList )
    end
    
end

function x805041_GenObj( sceneId, PosList )     --生成山鬼、山妖
    local PosIndex = {}
    local IndexList = {}
    
    local numShanGui	=	5 
    local numShanYao	=	10
    
    local IndexListSize = numShanGui + numShanYao
    x805041_CollectIndex( PosList, IndexList, IndexListSize )
    
    local IndexListSize = getn( IndexList )
    
    local i=1
    local str
    for i=1, numShanGui do 
    	if IndexListSize < 1 then
    		break
    	end   
    	--PrintNum(9636)
		local MonsterId = LuaFnCreateMonster( sceneId, 9636, PosList[ IndexList[IndexListSize] ].x, PosList[ IndexList[IndexListSize] ].z, 3, -1, 805043 )
		SetCharacterDieTime(sceneId, MonsterId, 1000*60*15)	
		
		IndexListSize = IndexListSize -1
    end
    
    for i=1, numShanYao do 
    	if IndexListSize < 1 then
    		break
    	end   
    	--PrintNum(9637)
		local MonsterId = LuaFnCreateMonster( sceneId, 9637, PosList[ IndexList[IndexListSize] ].x, PosList[ IndexList[IndexListSize] ].z, 3, -1, 805040 )
		SetCharacterDieTime(sceneId, MonsterId, 1000*60*15)	
		
		IndexListSize = IndexListSize -1
    end
      
end

--**********************************
--心跳函数
--**********************************
function x805041_OnTimer( sceneId, actId, uTime )
	local	beginTime = GetActivityParam( sceneId, actId, x805041_g_TimeIndex )
	local	monsterGroup = GetActivityParam( sceneId, actId, x805041_g_MonsterGroup )
	local 	noticeTick	= GetActivityParam( sceneId, actId, x805041_g_NoticeTick )
	
	local currTime = LuaFnGetCurrentTime()
	
	--PrintNum( currTime - beginTime )
	
	if 		(currTime - beginTime > 0 and monsterGroup==0)
		or	(currTime - beginTime > 910 and monsterGroup==1 )
		or	(currTime - beginTime > 1810 and monsterGroup==2 )
	then
		x805041_GenObj( sceneId, x805041_g_scenePosInfoList )
		monsterGroup = monsterGroup + 1
	end
	
	if 		(currTime - beginTime > 0 and noticeTick==0 )
		or	(currTime - beginTime > 60 and noticeTick==1 )
		or	(currTime - beginTime > 120 and noticeTick==2 )
	then
		local cityName = LuaFnCityGetNameBySceneId( sceneId )
		local cityDefaultName = LuaFnCityGetDefaultNameBySceneId( sceneId )
		AddGlobalCountNews( sceneId, "@*;SrvMsg;SCA:#P"..cityDefaultName.."告急！帮会城市"..cityName.."之中突然出现一群山神山鬼，请各位弟兄速回帮会肃清来犯之敌。" )
		
		noticeTick = noticeTick + 1
	end
	
	SetActivityParam( sceneId, actId, x805041_g_MonsterGroup, monsterGroup)
	SetActivityParam( sceneId, actId, x805041_g_NoticeTick, noticeTick)
	
	--检测活动是否过期
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )

	end

end

--**********************************
--事件交互入口 19-145-40 18-149-48
--**********************************
function x805041_OnDefaultEvent( sceneId, actId, param1, param2, param3, param4, param5 )

	--参数说明：场景ID，活动ID，时间间隔 公告
	StartOneActivity( sceneId, actId, 1, param1 )
	
	SetActivityParam(sceneId, actId, x805041_g_TimeIndex,  		LuaFnGetCurrentTime())
	SetActivityParam(sceneId, actId, x805041_g_MonsterGroup, 	0 )
	SetActivityParam(sceneId, actId, x805041_g_NoticeTick, 		0 )
	
	local strLog = format("Activity Start  SceneId=%d, CityName=%s", sceneId, LuaFnCityGetNameBySceneId( sceneId ) )
	AuditProtectGuild( sceneId, strLog)
end
