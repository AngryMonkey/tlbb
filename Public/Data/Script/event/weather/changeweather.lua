
--���ӹ���*�����������*����ϵͳ�ű�����

--�ű���
x820001_g_ScriptId	= 820001

--������10000Ϊ100%

x820001_WeatherRand ={
												3000,--����
												1000,--����
												1000,--�η�
															--����Ϊ����
											}

x820001_WeatherEffect = {
													19,--����
													17,--����
													18,--�η�
															--Ĭ��Ϊ����
												} 
	
	x820001_WeatherTime = {
													
													24*60*60,--���� 1�� ��λ��
													24*60*60,--���� 1�� ��λ��
													24*60*60,--�η� 1�� ��λ��
															--Ĭ��Ϊ����
												}											
											
--**********************************
--�ű���ں���
--**********************************
function x820001_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )
	
	--�����....
	StartOneActivity( sceneId, actId, 180*1000, iNoticeType )

	local randweather = random(10000);
	
	--���������仯
	if randweather < x820001_WeatherRand[1]+ 1 then
		LuaFnSetSceneWeather(sceneId, x820001_WeatherEffect[1],  x820001_WeatherTime[1]* 1000 );
	elseif randweather < x820001_WeatherRand[1] + x820001_WeatherRand[2] + 1 then
		LuaFnSetSceneWeather(sceneId, x820001_WeatherEffect[2], x820001_WeatherTime[2] * 1000 );
	elseif randweather < x820001_WeatherRand[1] + x820001_WeatherRand[2] + x820001_WeatherRand[3] + 1 then
		LuaFnSetSceneWeather(sceneId, x820001_WeatherEffect[3], x820001_WeatherTime[3] * 1000 );
	end

end

--**********************************
--��������
--**********************************
function x820001_OnTimer( sceneId, actId, uTime )

	--����Ƿ����
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end


