--ؤ��NPC
--��ȫ��
--��ͨ

x010008_g_scriptId = 010008

x010008_g_xuanWuDaoId=400918 --[tx42913]

--������Ϣ(�������ƣ�SceneID��PosX��PosY������ID)
x010008_g_mpInfo		= {}
x010008_g_mpInfo[0]	= { "����", 16,  96, 152, MP_XINGSU }
x010008_g_mpInfo[1]	= { "��ң", 14,  67, 145, MP_XIAOYAO }
x010008_g_mpInfo[2]	= { "����",  9,  95, 137, MP_SHAOLIN }
x010008_g_mpInfo[3]	= { "��ɽ", 17,  95, 120, MP_TIANSHAN }
x010008_g_mpInfo[4]	= { "����", 13,  96, 120, MP_DALI }
x010008_g_mpInfo[5]	= { "����", 15,  89, 144, MP_EMEI }
x010008_g_mpInfo[6]	= { "�䵱", 12, 103, 140, MP_WUDANG }
x010008_g_mpInfo[7]	= { "����", 11,  98, 167, MP_MINGJIAO }
x010008_g_mpInfo[8]	= { "ؤ��", 10,  91, 116, MP_GAIBANG }

--**********************************
--�¼��������
--**********************************
function x010008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{MPXL_090113_06}")
		if	GetLevel( sceneId, selfId)>=10  then	
			AddNumText(sceneId,x010008_g_scriptId,"����",9,0)
			AddNumText(sceneId,x010008_g_scriptId,"����",9,1)
			AddNumText( sceneId, x010008_g_scriptId, "���� - �����̻�", 9, 3 )
			AddNumText( sceneId, x010008_g_scriptId, "���� - ������", 9, 4 )
		end
		
		--add by WTT
		if	GetLevel( sceneId, selfId)>=20  then	
			AddNumText( sceneId, x010008_g_scriptId, "���ӹ���", 9, 6 )
		end
		
		if	GetLevel( sceneId, selfId)>=75  then	
			AddNumText( sceneId, x010008_g_scriptId, "#{MPCSLL_80925_01}", 9, 5 )
		end
		AddNumText(sceneId,x010008_g_scriptId,"����",9,2)
		
		--[tx42913]
		CallScriptFunction( x010008_g_xuanWuDaoId, "OnEnumerate",sceneId, selfId, targetId )
		--[/tx42913]		
		
		AddNumText(sceneId,x010008_g_scriptId,"����ȥ�������ɰ�",9,11)

		-- ����������ȥ�ػͺ���ɽ
		AddNumText( sceneId, x010008_g_scriptId, "����������ȥ�ػͺ���ɽ", 11, 2000 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x010008_OnEventRequest( sceneId, selfId, targetId, eventId )

------------------------------------------------------------------------------------------
--[tx42913]
	if eventId == x010008_g_xuanWuDaoId then --ȥ���䵺
		CallScriptFunction( x010008_g_xuanWuDaoId, "OnDefaultEvent",sceneId, selfId, targetId )
		return
	end
--[/tx42913]
	if GetNumText() == 2000 then		--
		BeginEvent( sceneId )
			AddText( sceneId, "#{GOTO_DUNHUANF_SONGSHAN}" ) 
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
		return
	end
  
    if  GetNumText() == 11 then
        
		BeginEvent(sceneId)
		    
		    for i=0, 8 do
				AddNumText( sceneId, x010008_g_scriptId, "���� - "..x010008_g_mpInfo[i][1], 9, i+12 )
			end			
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)	
		return 
    end
    
    num = GetNumText()

 	if num > 11 then
 		-- �����������ǲ�����113��BUFF
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 113) == 1   then
			BeginEvent( sceneId )
				AddText( sceneId, "  �������ˣ�����״̬�ǲ��ܴ������ﴫ�͵�" ) 
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			
			return
 		end
 	
 	    i = num - 12
		CallScriptFunction( (400900), "TransferFuncFromNpc", sceneId, selfId, x010008_g_mpInfo[i][2], x010008_g_mpInfo[i][3], x010008_g_mpInfo[i][4] )
		return
	end
------------------------------------------------------------------------------------------ 

	if	GetNumText()==0	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 0,229,322, 10)
	elseif	GetNumText()==1	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 1,203,258, 10)
	elseif	GetNumText()==3	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 0,330,272, 10)
	elseif	GetNumText()==4	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 1,330,224, 10)
	elseif	GetNumText()==2	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 2,375,227)
	elseif  GetNumText()==5	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 186,288,136,75)
	end
	
	--add by WTT
	if GetNumText()== 6 then					--���ӹ���		
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x010008_g_scriptId);			
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId, "GotoShuHeGuZhen");
			UICommand_AddString(sceneId, "���ӹ���Ϊ����ɱ����������ע�ⰲȫ����ȷ��Ҫ������");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end

end

--add by WTT
function x010008_GotoShuHeGuZhen( sceneId, selfId, targetId )
	CallScriptFunction((400900), "TransferFuncFromNpc", sceneId, selfId, 420, 200, 211, 20 );
	return
end
