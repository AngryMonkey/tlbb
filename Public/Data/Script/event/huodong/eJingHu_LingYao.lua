--̫��NPC
--�췴����
--��ͨ

--�ű���
x808037_g_ScriptId	= 808037

----------------------------------------------------
--
x808037_LingYao								= {}
x808037_LingYao["status"]					= 0		--�״̬��0 û��������1������
x808037_LingYao["QianNianCaoGen"]			= 1		--�Ƿ��Ѿ���������ǧ���
x808037_LingYao["YaoDing_LianYao_Status"]	= 2		-- ҩ�� ��ҩ״̬��0û��ҩ���� 1 ����ҩ��(�ɹ���)��2 ����ҩ�����ɶԻ���
x808037_LingYao["SelfID"]					= 3		-- ��¼ ��ǰ ��ҩ��� ��ID
x808037_LingYao["YaoDing_LianYao_Time"]		= 4		-- ����ҩ��(�ɹ���) ��ʱ�䣬 ��Ҫ��ONTIMER ����� ��ʱ����й���
x808037_LingYao["MonsterID"]				= 5		--ҩ��(�ɹ���) �� ID 
x808037_LingYao["BroardFlag5"]				= 6		--
x808037_LingYao["BroardFlag10"]				= 7		--
x808037_LingYao["BroardFlag15"]				= 8		--
x808037_LingYao["UserName"]					= 9		--

x808037_GrowPoint =
{
 [1] = { x = 76, z = 55 },
 [2] = { x = 89, z = 42 },
 [3] = { x = 100, z = 34 },
}

--**********************************
--�¼�������� 19-145-40 18-149-48
--**********************************
function x808037_OnDefaultEvent( sceneId, actId, param1, param2, param3, param4, param5 )

	local status = GetActivityParam( sceneId, actId, x808037_LingYao["status"] );
	
	if status > 0 then
	
		x808037_OnActivityEnd( sceneId, actId );
		
	end
	
	StartOneActivity( sceneId, actId, floor(60*10) )			
	SetActivityParam( sceneId, actId, x808037_LingYao["status"], 1 );
		
	local message = format("@*;SrvMsg;SCA:#{JingHu_LingYao_00}" );		
	AddGlobalCountNews( sceneId, message )

	
end


--**********************************
--��������
--**********************************
function x808037_OnTimer( sceneId, actId, uTime )

	--begin modified by zhangguoxin 090207
	--local CurTime = GetHourTime()		--��ǰʱ��
	--local CurDaytime = floor(CurTime/100)	--��ǰʱ��(��)
	--local CurQuarterTime = mod(CurTime,100)	--��ǰʱ��(��)
	local CurQuarterTime = mod(GetQuarterTime(),100);				--��ǰʱ��(��)
	--end modified by zhangguoxin 090207
	local nCurTime = LuaFnGetCurrentTime();
	
	if CurQuarterTime >= 88 then
		x808037_OnActivityEnd( sceneId, actId );		
		return 0;
	end
	 
	local LianYaoStatus = GetActivityParam( sceneId, actId, x808037_LingYao["YaoDing_LianYao_Status"] );
--	PrintStr("x808037_OnTimer--LianYaoStatus:"..LianYaoStatus);
	if LianYaoStatus == 1 then
	 
		local nCurTime = LuaFnGetCurrentTime();
		local nStartTime = GetActivityParam( sceneId, actId, x808037_LingYao["YaoDing_LianYao_Time"] );
		local nDelta = nCurTime - nStartTime;
		
		local idMonster = GetActivityParam( sceneId, actId, x808037_LingYao["MonsterID"] );
		local nPlayerX, nPlayerZ = GetWorldPos(sceneId, idMonster);
		nPlayerX = nPlayerX + 1;
		nPlayerZ = nPlayerZ + 1;

		local idPlayerSelf = GetActivityParam( sceneId, actId, x808037_LingYao["SelfID"] );
		
		local bBroardFlag5 = GetActivityParam( sceneId, actId, x808037_LingYao["BroardFlag5"] );
		local bBroardFlag10 = GetActivityParam( sceneId, actId, x808037_LingYao["BroardFlag10"] );
		local bBroardFlag15 = GetActivityParam( sceneId, actId, x808037_LingYao["BroardFlag15"] );
			
		if nDelta >= 60*14 and bBroardFlag15 == 0 then
			szPlayerName = JINGHU_YAODING_CREATER_NAME;
			local message = format("#{JingHu_LingYao_04}#{_INFOUSR%s}#{JingHu_LingYao_05}", szPlayerName);	
			AddGlobalCountNews( sceneId, message )
			
			LuaFnDeleteMonster( sceneId, idMonster);
	
			local MonsterId = LuaFnCreateMonster( sceneId, 881, nPlayerX, nPlayerZ, 3, 0, 5112 ); 
		-- ��ʱ�������� ����
		--	local MonsterId = LuaFnCreateMonster( sceneId, 473, nPlayerX, nPlayerZ, 3, 0, 808038) 
			
			SetUnitReputationID( sceneId, MonsterId, MonsterId, 0 );
			
			SetCharacterDieTime(sceneId, MonsterId, 1000*60*60)
			SetActivityParam( sceneId, actId, x808037_LingYao["BroardFlag15"], 1 );
			SetActivityParam( sceneId, actId, x808037_LingYao["YaoDing_LianYao_Status"], 2 );
			
		elseif nDelta >= 60*9 and bBroardFlag10 == 0 then
		
			local message = format("#{JingHu_LingYao_06}");	
			AddGlobalCountNews( sceneId, message )
			SetActivityParam( sceneId, actId, x808037_LingYao["BroardFlag10"], 1 );
			
		elseif nDelta >= 60*4 and bBroardFlag5 == 0 then
		
			local message = format("#{JingHu_LingYao_07}");	
			AddGlobalCountNews( sceneId, message )
			SetActivityParam( sceneId, actId, x808037_LingYao["BroardFlag5"], 1 );
		
		end
		
	end

end


--**********************************
--�����
--**********************************
function x808037_OnActivityEnd( sceneId, actId )

	SetActivityParam( sceneId, actId, x808037_LingYao["status"], 0 );
	SetActivityParam( sceneId, actId, x808037_LingYao["QianNianCaoGen"], 0 );
	SetActivityParam( sceneId, actId, x808037_LingYao["YaoDing_LianYao_Status"], 0 );
	SetActivityParam( sceneId, actId, x808037_LingYao["SelfID"], 0 );
	SetActivityParam( sceneId, actId, x808037_LingYao["YaoDing_LianYao_Time"], 0 );
	
	SetActivityParam( sceneId, actId, x808037_LingYao["MonsterID"], 0 );
	SetActivityParam( sceneId, actId, x808037_LingYao["BroardFlag5"], 0 );
	SetActivityParam( sceneId, actId, x808037_LingYao["BroardFlag10"], 0 );
	SetActivityParam( sceneId, actId, x808037_LingYao["BroardFlag15"], 0 );

	StopOneActivity( sceneId, actId )	

end
