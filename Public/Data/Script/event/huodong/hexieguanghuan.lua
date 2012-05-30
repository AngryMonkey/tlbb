--�����
--��г�⻷���ο����¹⻷��

--�ű���
x808124_g_ScriptId = 808124

--��г�⻷�ؿ���2009��8��12��00��00~2009��9��16��24��00�������czf��2009.07.31
--���ʼʱ�� 2009-8-12
x808124_g_HeXieGuangHuan_BeginDayTime = 20090812

--�����ʱ�� 2009-9-16
x808124_g_HeXieGuangHuan_EndDayTime = 20090916   

--level��ʾ��ʼ�ȼ�����������ȼ��Ϳ��Ի�ú����BUFF
x808124_g_Impact = {
		{level = 0,	buffId = 186},			--1-10	
		{level = 10,	buffId = 187},		--11-20
		{level = 20,	buffId = 188},		--21-30
		{level = 30,	buffId = 189},		--31-40
		{level = 40,	buffId = 190},		--41-50
		{level = 50,	buffId = 191},		--51-60
		{level = 60,	buffId = 192},		--61-70
		{level = 70,	buffId = 193},		--71-80
		{level = 80,	buffId = 194},		--81-90
		{level = 90,	buffId = 195},		--91-100
		{level = 100,	buffId = 196},		--101-110
		{level = 110,	buffId = 197}		--111-119
}


--**********************************
--������ں���
--**********************************
function x808124_OnDefaultEvent( sceneId, selfId, targetId )

	local isTime = x808124_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	local opt = GetNumText();
	
	if( 1 == opt ) then				--�������г�⻷��
		BeginEvent(sceneId)
			AddText(sceneId, "#{HXGH_90105_3}");
			AddNumText(sceneId, x808124_g_ScriptId, "#{HXGH_90105_4}", 8, 11 )
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)
	elseif( 11 == opt ) then	--������ǡ�
		local lastDate = GetMissionData( sceneId, selfId, MD_HEXIE_GUANGHUAN_DATE )	--��һ����ȡ����
		local curDate = GetTime2Day()

		if curDate > lastDate then
			if IsPilferLockFlag( sceneId, selfId ) <= 0 then
				return	--��ȫʱ���ڲ��ò���
			else
				--������ȡ����������ȡ����ټ�BUFF
				SetMissionData( sceneId, selfId, MD_HEXIE_GUANGHUAN_DATE, curDate )
				x808124_AddHeXieGuangHuan( sceneId, selfId )
		
				BeginEvent(sceneId)
					AddText(sceneId,"#{HXGH_90105_7}");
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		else
			--�����Ѿ���ȡ����
			BeginEvent(sceneId)
				AddText(sceneId,"#{HXGH_90105_6}");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif( 111 == opt ) then	--��������ں�г�⻷��,czf,2009.07.31
		BeginEvent(sceneId)
			AddText(sceneId,"#{HXGH_90105_3}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x808124_OnEnumerate( sceneId, selfId, targetId )

    local isTime = x808124_CheckRightTime()

    if 1 == isTime then
			AddNumText(sceneId, x808124_g_ScriptId, "#{HXGH_90105_1}", 1, 1 )
			AddNumText(sceneId, x808124_g_ScriptId, "#{HXGH_90105_2}", 11, 111 )
    end
end

--**********************************
--����Ƿ��ѽ���
--**********************************
function x808124_CheckRightTime()

    local curDayTime = GetTime2Day()

    if curDayTime > x808124_g_HeXieGuangHuan_EndDayTime then
       return 0
    elseif curDayTime < x808124_g_HeXieGuangHuan_BeginDayTime then
       return 0
    else
    	return 1
    end

end

--**********************************
--����Ҽ��Ϻ�г�⻷buff
--**********************************
function x808124_AddHeXieGuangHuan( sceneId, selfId )

	local myLevel = GetLevel(sceneId, selfId)
	local buffId = -1

	for index = 1 , getn(x808124_g_Impact) do
		if( myLevel > x808124_g_Impact[index].level ) then
			buffId = x808124_g_Impact[index].buffId
		end
	end
	
	if( buffId ~= -1 ) then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, buffId, 0);
	end
	
end

--**********************************
--����
--**********************************
function x808124_OnPlayerLogin( sceneId, selfId )
	--���ʱ��
	local isTime = x808124_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	local lastMailDate = GetMissionData( sceneId, selfId, MD_HEXIE_GUANGHUAN_MAIL_DATE )	--��һ����ȡ����
	local curMailDate = GetTime2Day()

	if curMailDate > lastMailDate then
		--���ջ�δ����ϵͳ�ʼ�
		--�ȱ��������ʼ�����Ϊ����
		SetMissionData( sceneId, selfId, MD_HEXIE_GUANGHUAN_MAIL_DATE, curMailDate )
		
		LuaFnSendSystemMail( sceneId, GetName( sceneId, selfId ), "#{HXGH_90105_8}" )
	end
	
end

--**********************************
--����������
--**********************************
function x808124_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x808124_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x808124_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x808124_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x808124_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x808124_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x808124_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--���������¼�
--**********************************
function x808124_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x808124_OnItemChanged( sceneId, selfId, itemdataId )
end
