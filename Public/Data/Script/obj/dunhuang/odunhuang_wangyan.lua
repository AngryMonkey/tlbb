--����
--�ػʹ��ͻ���ɽ

--�ű���
x008112_g_ScriptId	= 008112

--��ӵ�е��¼�ID�б�
x008112_g_Transport = 400900

x008112_g_Impact_Transport_Mission = 113 -- ����״̬��Ч--[tx45130]
--Ŀ�곡��
--**********************************
--�¼��������
--**********************************
function x008112_OnDefaultEvent( sceneId, selfId, targetId )
	local	nam	= GetName( sceneId, selfId )

	BeginEvent( sceneId )
	AddText( sceneId, nam.."��һ�����ش�Į��ɳ��������ȥ�����ǻ���ɽ��!;������ɽ�ܹ�����߲��Ź��ȵط�����һ·�����쳣��ֻ��#G90������#W��Ӣ�۲����ʸ�ǰȥð�ա�" )
	AddNumText( sceneId, x008112_g_ScriptId, "����ȥ����ɽ", 9, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x008112_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetLevel( sceneId, selfId ) < 90 then 
		BeginEvent( sceneId )
			AddText( sceneId, "  ��ȥһ·�����쳣������ĵȼ��в���90����Ϊ����İ�ȫ���룬����ʱ���������Ұɡ�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	else 
		--[tx45130]	
		local haveImpact = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x008112_g_Impact_Transport_Mission)
		if haveImpact == 1 then
				BeginEvent(sceneId)
					AddText(sceneId,"#{Transfer_090304_1}");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end
		--[/tx45130]
		CallScriptFunction((x008112_g_Transport), "TransferFunc",sceneId, selfId, 423, 223, 29, 90, 1000)
	end
end
