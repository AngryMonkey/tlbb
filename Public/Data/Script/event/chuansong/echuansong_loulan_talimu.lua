--��ӵ�е��¼�ID�б�
x400943_g_Transport = 400900

--��ҽ���һ�� area ʱ����
function x400943_OnEnterArea( sceneId, selfId )
        if GetLevel( sceneId, selfId ) < 90 then 
		BeginEvent( sceneId )
			AddText( sceneId, "  ����ǳ�Σ�գ�����ĵȼ��в���90����Ϊ����İ�ȫ���룬����Щʱ���ٳ��ǰɡ�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, -1 )
	else 
		CallScriptFunction((x400943_g_Transport), "TransferFunc",sceneId, selfId, 425, 31, 27, 90, 1000)
	end
	
end


--�����һ�� area ����һ��ʱ��û����ʱ����
function x400943_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400943_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400943_OnLeaveArea( sceneId, selfId )
end
