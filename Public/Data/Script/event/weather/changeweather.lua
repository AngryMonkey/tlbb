
--束河古镇*场景功能设计*天气系统脚本制作

--脚本号
x820001_g_ScriptId	= 820001

--概率以10000为100%

x820001_WeatherRand ={
												3000,--雨天
												1000,--大雾
												1000,--刮风
															--其他为晴天
											}

x820001_WeatherEffect = {
													19,--雨天
													17,--大雾
													18,--刮风
															--默认为晴天
												} 
	
	x820001_WeatherTime = {
													
													24*60*60,--雨天 1天 单位秒
													24*60*60,--大雾 1天 单位秒
													24*60*60,--刮风 1天 单位秒
															--默认为晴天
												}											
											
--**********************************
--脚本入口函数
--**********************************
function x820001_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )
	
	--开启活动....
	StartOneActivity( sceneId, actId, 180*1000, iNoticeType )

	local randweather = random(10000);
	
	--设置天气变化
	if randweather < x820001_WeatherRand[1]+ 1 then
		LuaFnSetSceneWeather(sceneId, x820001_WeatherEffect[1],  x820001_WeatherTime[1]* 1000 );
	elseif randweather < x820001_WeatherRand[1] + x820001_WeatherRand[2] + 1 then
		LuaFnSetSceneWeather(sceneId, x820001_WeatherEffect[2], x820001_WeatherTime[2] * 1000 );
	elseif randweather < x820001_WeatherRand[1] + x820001_WeatherRand[2] + x820001_WeatherRand[3] + 1 then
		LuaFnSetSceneWeather(sceneId, x820001_WeatherEffect[3], x820001_WeatherTime[3] * 1000 );
	end

end

--**********************************
--心跳函数
--**********************************
function x820001_OnTimer( sceneId, actId, uTime )

	--检测活动是否过期
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end


