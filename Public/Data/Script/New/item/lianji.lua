--����NPC
--�ȼ��콱
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000165_OnDefaultEvent( sceneId, selfId,targetId )
	local temp = random(10)
	local msgStr = format( "#Y�����������ȡ�ȼ�����������ﵽ���µȼ�����Ʒ���Ǻܷ���ޣ����Ͱɣ���ȡ149������ʱ���ϲ��ܳ���10W")
	BeginEvent(sceneId)
		AddText(sceneId,msgStr)
		--AddNumText( sceneId, x000160_g_ScriptId, "#gFF3E96��ȡ30��Ԫ������", 5, 100 )
		--AddNumText( sceneId, x000160_g_ScriptId, "#gFF3E96��ȡ40��Ԫ������", 5, 200 )
		--AddNumText( sceneId, x000160_g_ScriptId, "#gFF3E96��ȡ50��Ԫ������", 5, 300 )
		--AddNumText( sceneId, x000160_g_ScriptId, "#gFF3E96��ȡ60��Ԫ������", 5, 400 )
		AddNumText( sceneId, x000160_g_ScriptId, "#gFF3E96��ȡ70��Ԫ������", 5, 500 )
		AddNumText( sceneId, x000160_g_ScriptId, "#gFF3E96��ȡ80��Ԫ������", 5, 600 )
		AddNumText( sceneId, x000160_g_ScriptId, "#gFF3E96��ȡ90��Ԫ������", 5, 700 )
		AddNumText( sceneId, x000160_g_ScriptId, "#gFF3E96��ȡ100��Ԫ������", 5, 800 )
		AddNumText( sceneId, x000160_g_ScriptId, "#gFF3E96��ȡ130��Ԫ������", 5, 900 )
		AddNumText( sceneId, x000160_g_ScriptId, "#gFF3E96��ȡ149��Ԫ������", 5, 1000 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000165_OnEventRequest( sceneId, selfId, targetId, eventId)
		if GetNumText() == 100 then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<30 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ���ĵȼ���������������30���������Ұɡ�" )
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL30 )
		if index == 1 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ���Ѿ���ȡ���ý�����" )
			return
		else
			YuanBao(sceneId,selfId,targetId,1,5000)
--			AddMoney( sceneId, selfId, 100000 )
			SetMissionData( sceneId, selfId, DANJIAN_JL30, 1 )
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ��ϲ�����ɹ���ȡ30��������#G10��#W�����ٽ������ޣ�����Ľ������ḻ�ء�" )
		end
		elseif GetNumText() == 200 then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<40 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ���ĵȼ���������������40���������Ұɡ�" )
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL40 )
		if index == 1 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ���Ѿ���ȡ���ý�����" )
			return
		else
				YuanBao(sceneId,selfId,targetId,1,5000)
--   			AddMoney( sceneId, selfId, 300000 )
			SetMissionData( sceneId, selfId, DANJIAN_JL40, 1 )
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ��ϲ�����ɹ���ȡ40��������#G30��#W�����ٽ������ޣ�����Ľ������ḻ�ء�" )
		end
		elseif GetNumText() == 300 then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<50 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ���ĵȼ���������������50���������Ұɡ�" )
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL50 )
		if index == 1 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ���Ѿ���ȡ���ý�����" )
			return
		else
			YuanBao(sceneId,selfId,targetId,1,500)
   			--AddMoney( sceneId, selfId, 300000 )
			SetMissionData( sceneId, selfId, DANJIAN_JL50, 1 )
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ��ϲ�����ɹ���ȡ50��������#G500Ԫ��#W�����ٽ������ޣ�����Ľ������ḻ�ء�" )
		end
			elseif GetNumText() == 400 then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<60 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ���ĵȼ���������������60���������Ұɡ�" )
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL60 )
		if index == 1 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ���Ѿ���ȡ���ý�����" )
			return
		else
			YuanBao(sceneId,selfId,targetId,1,1000)
   			AddMoney( sceneId, selfId, 500000 )
			SetMissionData( sceneId, selfId, DANJIAN_JL60, 1 )
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ��ϲ�����ɹ���ȡ60��������#G1000Ԫ��#W�����ٽ������ޣ�����Ľ������ḻ�ء�" )
		end
			elseif GetNumText() == 500 then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<70 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ���ĵȼ���������������70���������Ұɡ�" )
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL70 )
		if index == 1 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ���Ѿ���ȡ���ý�����" )
			return
		else
			YuanBao(sceneId,selfId,targetId,1,1000)
   			--AddMoney( sceneId, selfId, 1000000 )
			SetMissionData( sceneId, selfId, DANJIAN_JL70, 1 )
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ��ϲ�����ɹ���ȡ70��������#G1000Ԫ��#W�����ٽ������ޣ�����Ľ������ḻ�ء�" )
		end
			elseif GetNumText() == 600 then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<80 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ���ĵȼ���������������80���������Ұɡ�" )
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL80 )
		if index == 1 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ���Ѿ���ȡ���ý�����" )
			return
		else
			YuanBao(sceneId,selfId,targetId,1,2000)
   			--AddMoney( sceneId, selfId, 5000000 )
			SetMissionData( sceneId, selfId, DANJIAN_JL80, 1 )
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ��ϲ�����ɹ���ȡ80��������#G2000Ԫ��#W�����ٽ������ޣ�����Ľ������ḻ�ء�" )
		end
			elseif GetNumText() == 700 then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<90 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ���ĵȼ���������������90���������Ұɡ�" )
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL90 )
		if index == 1 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ���Ѿ���ȡ���ý�����" )
			return
		else
			YuanBao(sceneId,selfId,targetId,1,5000)
   			--AddMoney( sceneId, selfId, 1000000 )
			SetMissionData( sceneId, selfId, DANJIAN_JL90, 1 )
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ��ϲ�����ɹ���ȡ90��������#G5000Ԫ��#W�����ٽ������ޣ�����Ľ������ḻ�ء�" )
		end
			elseif GetNumText() == 800 then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<100 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ���ĵȼ���������������100���������Ұɡ�" )
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL100 )
		if index == 1 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ���Ѿ���ȡ���ý�����" )
			return
		else
			YuanBao(sceneId,selfId,targetId,1,8000)
   			--AddMoney( sceneId, selfId, 2000000 )
			SetMissionData( sceneId, selfId, DANJIAN_JL100, 1 )
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ��ϲ�����ɹ���ȡ100��������#G8000Ԫ��#W�����ٽ������ޣ�����Ľ������ḻ�ء�" )
		end
			elseif GetNumText() == 900 then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<130 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ���ĵȼ���������������130���������Ұɡ�" )
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL120 )
		if index == 1 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ���Ѿ���ȡ���ý�����" )
			return
		else
			YuanBao(sceneId,selfId,targetId,1,12000)
   			--AddMoney( sceneId, selfId, 10000000 )
			SetMissionData( sceneId, selfId, DANJIAN_JL120, 1 )
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ��ϲ�����ɹ���ȡ130��������#G12000Ԫ��#W�����ٽ������ޣ�����Ľ������ḻ�ء�" )
		end
			elseif GetNumText() == 1000 then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<149 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ���ĵȼ���������������149���������Ұɡ�" )
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL149 )
		if index == 1 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ���Ѿ���ȡ���ý�����" )
			return
		else
			YuanBao(sceneId,selfId,targetId,1,500000)
   			--AddMoney( sceneId, selfId, 30000000 )
			SetMissionData( sceneId, selfId, DANJIAN_JL149, 1 )
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  ��ϲ�����ɹ���ȡ149��������#G500000Ԫ��#W�����ٽ������ޣ�����Ľ������ḻ�ء�" )
		end
	end
end
--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x000165_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x000165_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end