--������
--Created by zchw
--�ű���712534

--ÿ�δ򿪱ض���õĲ�Ʒ

x712534_g_NumOdds =
{
	{num = 1, odd = 85},		--1���ļ���
	{num = 2, odd = 10},		--2���ļ���
	{num = 3, odd = 5},			--3���ļ���
}
--������ʱ��
x712534_g_weekDay			= 0;
x712534_g_StartTime 	= 1900;
x712534_g_EndTime 		= 2000;

x712534_g_GPInfo = {};
x712534_g_GPInfo[791] = { name = "��ʯ", misId = 1140, itemId = 40004464}
x712534_g_GPInfo[792] = { name = "����", misId = 1141, itemId = 40004462}
x712534_g_GPInfo[793] = { name = "��Ҷ��", misId = 1142, itemId = 40004463}

--���ɺ�����ʼ************************************************************************
--ÿ��ItemBox�����10����Ʒ
function	x712534_OnCreate(sceneId,growPointType,x,y)

	local item_id = x712534_g_GPInfo[growPointType].itemId
	local ItemBoxId = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,item_id)	
	
	local rdm = random(100);
	local num = 0;
	if rdm < x712534_g_NumOdds[1].odd then
		num = x712534_g_NumOdds[1].num;
	elseif rdm < x712534_g_NumOdds[1].odd+x712534_g_NumOdds[2].odd then
		num = x712534_g_NumOdds[2].num;
	else
		num = x712534_g_NumOdds[3].num;
	end
	
	while num > 1 do
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1 , item_id )
		num = num -1;
	end
	
end
--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	x712534_OnOpen(sceneId,selfId,targetId)
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId );
	local misId = x712534_g_GPInfo[growPointType].misId;
	if IsHaveMission(sceneId, selfId, misId) ~= 1 then
		local msg = format("#{BHSJ_081014_15}%s#{BHSJ_081014_16}", x712534_g_GPInfo[growPointType].name);
		x712534_Tips(sceneId, selfId, msg);
		return -29; 
	end 
	--ʱ��һ�£�
	local misIndex = GetMissionIndexByID(sceneId, selfId, misId);
	if GetMissionParam(sceneId, selfId, misIndex, 2) ~= GetWeekTime() then
		x712534_Tips(sceneId, selfId, "#{BHSJ_081014_18}");
		return -29;	
	end
	--����ڣ�
	local time = GetHour()*100 + GetMinute(); 
	if GetTodayWeek() ~= x712534_g_weekDay  then
		x712534_Tips(sceneId, selfId, "#{BHSJ_081014_11}");
		return -29;
	elseif  time < x712534_g_StartTime then
		x712534_Tips(sceneId, selfId, "#{BHSJ_081014_11}");
		return -29;
	elseif time > x712534_g_EndTime then
		x712534_Tips(sceneId, selfId, "#{BHSJ_081014_18}");
		return -29;
	end
	--������ɣ�
	if GetMissionParam(sceneId, selfId, misIndex, 0) == 1 then
		x712534_Tips(sceneId, selfId, "#{BHSJ_081014_17}");
		return -29;			
	end
	return 0; --OR_OK
end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--���պ�����ʼ########################################################################
function	x712534_OnRecycle(sceneId,selfId,targetId)
	--����1�����������
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId );
	local misId = x712534_g_GPInfo[growPointType].misId;
	local count = LuaFnGetItemCount(sceneId, selfId, x712534_g_GPInfo[growPointType].itemId);
	if count > 0 then
		local misIndex = GetMissionIndexByID(sceneId, selfId, misId);
		SetMissionByIndex(sceneId, selfId, misIndex, 0, 1);
		SetMissionByIndex(sceneId, selfId, misIndex, 1, count);
		x712534_Tips(sceneId, selfId, "#{YD_20080421_180}");
	end
	return 1
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x712534_OnProcOver(sceneId,selfId,targetId)
	return 0
end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

function x712534_OnTickCreateFinish( sceneId, growPointType, tickCount )
end

--**********************************
--ReturnTips
--**********************************
function x712534_Tips(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end
