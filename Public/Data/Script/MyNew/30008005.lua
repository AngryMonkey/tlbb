x300053_g_scriptId = 300053
--**********************************
-- �¼��������
--**********************************
function x300053_OnDefaultEvent( sceneId, selfId )
	if GetNumText()>=100 and GetNumText()<200 then
		x300053_SuiShen(sceneId, selfId)
	elseif GetNumText()>=200 and GetNumText()<300 then
		x300053_JiaRuMenPai(sceneId, selfId,0)
	elseif GetNumText()>=300 and GetNumText()<400 then
		x300053_BaoShi(sceneId, selfId)
	elseif GetNumText()>=400 and GetNumText()<500 or GetNumText()>=1000 and GetNumText()<2000 then
		x300053_ChuanSong(sceneId, selfId, 0,0)
	elseif GetNumText()>=500 and GetNumText()<600 then
		x300053_EquipBase(sceneId,selfId)
	elseif GetNumText()>=600 and GetNumText()<700 then
		x300053_Pet(sceneId,selfId)
	elseif GetNumText() == 7777  then
		x300053_XinFa(sceneId,selfId)
	elseif GetNumText() == 8888  then
		x300053_BackToIndex( sceneId, selfId )
	elseif GetNumText() == 9999  then
		x300053_CloseMe(sceneId, selfId)
	end
end
--**********************************
--װ������
--**********************************
function x300053_Pet(sceneId,selfId)
	if GetNumText()==600 then
		BeginEvent(sceneId)
			AddText(sceneId, "#G    ����ʯ������ع��ܼ��ϡ�")
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff����ѧϰ     #R�����޼���ѧϰ��", 5, 601)
			AddNumText(sceneId, x300053_g_scriptId,"#R������ҳ", 8, 8888)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif GetNumText()==601 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,selfId);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 223)
	end
end
--**********************************
--װ������
--**********************************
function x300053_EquipBase(sceneId,selfId)
	if GetNumText()==500 then
		BeginEvent(sceneId)
			AddText(sceneId, "#G    ����װ�����ܼ��ϡ�")
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff���ʼ���     #R��װ�����ʼ�����", 5, 501)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff�����ؼ�     #R�����¼������ʡ�", 5, 502)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fffװ��ǿ��     #R��װ���ȼ�ǿ����", 5, 503)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff�������     #R���������������", 5, 504)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fffװ������     #R��װ�����������", 5, 505)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fffװ������     #R��װ�����������", 5, 506)
			AddNumText(sceneId, x300053_g_scriptId,"#R������ҳ", 8, 8888)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif GetNumText()==501 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1001 )
	elseif GetNumText()==502 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 112233 )
	elseif GetNumText()==503 then
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,selfId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1002)
	elseif GetNumText()==504 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,selfId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1004)
	elseif GetNumText()==505 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,selfId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1005)
	elseif GetNumText()==506 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,selfId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1006)
	end
end
--**********************************
--���͹���
--**********************************
function x300053_ChuanSong(sceneId,selfId,key,isNPC)
	if key==0 then
		key=GetNumText()	
	end
	if key==400 then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y    #R��#Y�����ǣ�¥�����������ݡ���������ʮ������BOSS�㴫�͡�")
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff��������", 9, 401)
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff��������", 9, 402)
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fffBOSS����", 9, 404)
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff��������", 9, 403)
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff��������", 9, 406)
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff��������", 9, 405)
			if isNPC==0 then
				AddNumText(sceneId, x300053_g_scriptId,"#R������ҳ", 8, 8888)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif key==401 then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y    ��Ҫ���С����������ͽ���:")
			AddNumText(sceneId, x300053_g_scriptId,"     #cff0000¥��", 9, 424)
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff����", 9, 421)
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff����", 9, 422)
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff����", 9, 423)
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff������ ", 9, 1502)
			--AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff����У��     #R�������д�ʥ�ء�", 9, 425)
            --AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff�����ݳ�     #R����Ҫ����������", 9, 425)
			if isNPC==0 then
				AddNumText(sceneId, x300053_g_scriptId,"#R������ҳ", 8, 8888)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif key==425 then
		x300053_MsgBox( sceneId, selfId, "#cfff263    ¥�����������¹滮���ɽ����д��ˣ�ֱ�ӷ���������ս�Է���" )
		--x300053_GoTo(sceneId,selfId,0, 186, 328)--����
	elseif key==402 then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y    ʮ�����ɴ��ͽ���:")
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff���� - Ľ��    #R��Ľ��ɽׯ��", 9, 440)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff���� - ����      #R�����޺���", 9, 441)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff���� - ��ң      #R���貨����", 9, 442)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff���� - ����      #R�������¡�", 9, 443)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff���� - ��ɽ      #R������ɽ��", 9, 444)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff���� - ����      #R�������¡�", 9, 445)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff���� - ��ü      #R����üɽ��", 9, 446)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff���� - �䵱      #R���䵱ɽ��", 9, 447)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff���� - ����      #R�������", 9, 448)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff���� - ؤ��    #R��ؤ���ܶ桿", 9, 449)
			if isNPC==0 then
				AddNumText(sceneId, x300053_g_scriptId,"#R������ҳ", 8, 8888)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif key==404 then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y    ��̫�ͣ�����ұ������ϣ��Լ��ں����װ�������ˡ�")
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff���ӹ���  #R��BOSSר����", 9, 1501)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff��Ĺ�Ų�  #R��BOSSר����", 9, 1503)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff��ɽ����  #R��BOSSר����", 9, 1504)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff������    #R��BOSSר����", 9, 1502)
            AddNumText(sceneId, x300053_g_scriptId,"#g3f3fffͨ������  #R��BOSSר����", 9, 1512)
            AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff����ɽ    #R��BOSSר����", 9, 1513)
                    if isNPC==0 then
				AddNumText(sceneId, x300053_g_scriptId,"#R������ҳ", 8, 8888)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
        elseif key==1513 then
		x300053_GoTo(sceneId,selfId,561, 15, 33)--ɱ��
	elseif key==1512 then
		x300053_GoTo(sceneId,selfId,548, 256, 278)--ͨ����
        elseif key==1504 then
		x300053_GoTo(sceneId,selfId,414, 100, 98)--��ɽ����
	elseif key==1503 then
		x300053_GoTo(sceneId,selfId,167, 56, 79)--������Ĺ
	elseif key==1501 then
		x300053_GoTo(sceneId,selfId,420, 200, 211)--���ӹ���
	elseif key==1502 then
		x300053_GoTo(sceneId,selfId,580, 158, 61)--������
	elseif key==403 then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y    ����һ�����������ֳ��࣬���鳬ˬ:")
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fffͨ�����ع�       #R45 - 100", 9, 450)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff������Ĺ1��      #R35 - 60", 9, 1401)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff������Ĺ7��      #R60 - 80", 9, 1402)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff�ػʵع�1��      #R80 - 100", 9, 1403)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff�ػʵع�2��      #R80 - 100", 9, 1404)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff�ػʵع�3��      #R80 - 100", 9, 1405)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fffʥ��           #R100 - 150", 9, 1406)
			--AddNumText(sceneId, x300053_g_scriptId,"#cff0000ͨ�����ع�       #R��100 - 150��", 9, 450)
			--AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff���ظ���           #R��100 - 150��", 9, 470)
			--AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff�����Ĺ           #R��100 - 150��", 9, 462)
			--AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff���¥7��           #R��100 - 150��", 9, 464)

			if isNPC==0 then
				AddNumText(sceneId, x300053_g_scriptId,"#R������ҳ", 8, 8888)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif key==1401 then
		x300053_GoTo(sceneId,selfId,159, 68, 93)--������Ĺ1��
	elseif key==1402 then
		x300053_GoTo(sceneId,selfId,165, 29, 106)--������Ĺ7��
	elseif key==1403 then
		x300053_GoTo(sceneId,selfId,400, 228, 219)--�ػʵع�1��
	elseif key==1404 then
		x300053_GoTo(sceneId,selfId,401, 185, 163)--�ػʵع�2��
	elseif key==1405 then
		x300053_GoTo(sceneId,selfId,402, 225, 214)--�ػʵع�3��
	elseif key==1406 then
		x300053_GoTo(sceneId,selfId,537, 23, 107)--ʥ��

	elseif key==461 then
		x300053_GoTo(sceneId,selfId,421,  109, 21)--����ɽ
	elseif key==462 then
		x300053_GoTo(sceneId,selfId,539,  39, 43)--��˹ų�
	elseif key==463 then
		x300053_GoTo(sceneId,selfId,442,  104, 299)--��Դ
	elseif key==464 then
		x300053_GoTo(sceneId,selfId,533,  100, 100)--���¥
	elseif key==465 then
		x300053_GoTo(sceneId,selfId,443,  43, 218)--��Դɽ��
	elseif key==466 then
		x300053_GoTo(sceneId,selfId,441,  92, 91)--���ƽԭ
	elseif key==467 then
		x300053_GoTo(sceneId,selfId,421,  100, 100)--��¹ս��
	elseif key==468 then
		x300053_GoTo(sceneId,selfId,440,  100, 100)--�����Ĺ
	elseif key==469 then
		x300053_GoTo(sceneId,selfId,420,  100, 100)--���ӹ���
	elseif key==470 then
		x300053_GoTo(sceneId,selfId,421,  100, 100)--���ظ���
	elseif key==450 then
		x300053_GoTo(sceneId,selfId,295,  256.211, 378.436)--ͨ�����ع�
	elseif key==422 then
		x300053_GoTo(sceneId,selfId,0, 233, 321)--����
	elseif key==423 then
		x300053_GoTo(sceneId,selfId,1, 196, 259)--����
	elseif key==424 then
		x300053_GoTo(sceneId,selfId,186, 158, 44)--¥��
	elseif key==421 then
		x300053_GoTo(sceneId,selfId,2, 375, 225)--����
	elseif key==440 then
		x300053_GoTo(sceneId,selfId,535, 154, 165)--Ľ��
	elseif key==441 then
		x300053_GoTo(sceneId,selfId,16,  96, 152)--����
	elseif key==442 then
		x300053_GoTo(sceneId,selfId,14,  67, 145)--��ң
	elseif key==443 then
		x300053_GoTo(sceneId,selfId,9,  96, 127)--����
	elseif key==444 then
		x300053_GoTo(sceneId,selfId,17,  95, 120)--��ɽ
	elseif key==445 then
		x300053_GoTo(sceneId,selfId,13,  96, 120)--����
	elseif key==446 then
		x300053_GoTo(sceneId,selfId,15,  89, 139)--��ü
	elseif key==447 then
		x300053_GoTo(sceneId,selfId,12, 103, 150)--�䵱
	elseif key==448 then
		x300053_GoTo(sceneId,selfId,11,  98, 167)--����
	elseif key==449 then
		x300053_GoTo(sceneId,selfId,10,  91, 116)--ؤ��
	elseif key==405 then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y    ������������:")
			AddNumText(sceneId, x300053_g_scriptId,"   #g3f3fffʥ��ɽ  ", 9, 1301)			
			AddNumText(sceneId, x300053_g_scriptId,"   #g3f3fff����    ", 9, 1302)			
			AddNumText(sceneId, x300053_g_scriptId,"   #g3f3fff����ѩԭ", 9, 1303)			
			AddNumText(sceneId, x300053_g_scriptId,"   #g3f3fff��ԭ    ", 9, 1304)			
			AddNumText(sceneId, x300053_g_scriptId,"   #g3f3fff��ɽ    ", 9, 1305)			
			AddNumText(sceneId, x300053_g_scriptId,"   #g3f3fff���������", 9, 1306)			
			if isNPC==0 then
				AddNumText(sceneId, x300053_g_scriptId,"#R������ҳ", 8, 8888)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif key==1301 then
		x300053_GoTo(sceneId,selfId,158, 231,226)--ʥ��ɽ
	elseif key==1302 then
		x300053_GoTo(sceneId,selfId,32, 43, 37)--����
	elseif key==1303 then
		x300053_GoTo(sceneId,selfId,188, 60, 214)--����ѩԭ
	elseif key==1304 then
		x300053_GoTo(sceneId,selfId,20, 279, 255)--��ԭ
	elseif key==1305 then
		x300053_GoTo(sceneId,selfId,25, 276, 52)--��ɽ
	elseif key==1306 then
		x300053_GoTo(sceneId,selfId,427, 34, 25)--���������
	elseif key==406 then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y    �������������ⳡ������:")
			--AddNumText(sceneId, x300053_g_scriptId,"#cff0000BOSS���ٻ���ͼ   #R�����ⳡ����", 9, 1201)						
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff��ϸ���", 9, 1202)						
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff��ָ���", 9, 1203)						
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fffˮ�θ���", 9, 1204)						
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff���Ӹ���", 9, 1205)						
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff¥��Ѱ��", 9, 1206)						
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff������", 9, 1207)						
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fffƮ���", 9, 1208)						
			if isNPC==0 then
				AddNumText(sceneId, x300053_g_scriptId,"#R������ҳ", 8, 8888)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif key==1201 then
		x300053_GoTo(sceneId,selfId,458, 32, 33)--BOSS���ٻ���ͼ
	elseif key==1202 then
		x300053_GoTo(sceneId,selfId,2, 443, 231)--��ϸ���
	elseif key==1203 then
		x300053_GoTo(sceneId,selfId,2, 430, 234)--��ָ���
	elseif key==1204 then
		x300053_GoTo(sceneId,selfId,1, 339, 310)--ˮ�θ���
	elseif key==1205 then
		x300053_GoTo(sceneId,selfId,4, 70, 121)--���Ӹ���
	elseif key==1206 then
		x300053_GoTo(sceneId,selfId,186, 162, 75)--¥��Ѱ��
	elseif key==1207 then
		x300053_GoTo(sceneId,selfId,186, 290, 66)--������
	elseif key==1208 then
		x300053_GoTo(sceneId,selfId,186, 191, 219)--������ɽƮ��
	end
end
--**********************************
--���͹���
--**********************************
function x300053_GoTo( sceneId, selfId, toSceneId, x, y )
	-- �����������ǲ����С���Ʊ������������оͲ���ʹ������Ĺ���
	if GetItemCount(sceneId, selfId, x210504_g_Yinpiao)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "  ����������Ʊ���������̣��Ҳ��ܰ����㡣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	if sceneId~=0 and sceneId~=1 and sceneId~=2 and sceneId~=16 and sceneId~=14 and sceneId~=9 and sceneId~=17 and sceneId~=13 and sceneId~=15 and sceneId~=12 and sceneId~=11 and sceneId~=10 and sceneId~=380 and sceneId~=186 then
		x300053_Tips( sceneId, selfId, "��Ŀǰ���ڵĳ����޷�ʹ�ô��͹��ܣ���سǺ���ʹ��" )
		x300053_CloseMe(sceneId, selfId)
		return
	end
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, toSceneId, x, y )
end
--**********************************
--������ҳ
--**********************************
function x300053_BackToIndex( sceneId, selfId )
	x399999_OnDefaultEvent( sceneId, selfId, -1 )
end
--**********************************
--�����Ļ�м���ʾ
--**********************************
function x300053_Tips( sceneId, selfId, str )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x300053_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end
--**********************************
--�رնԻ���
--**********************************
function x300053_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end
--**********************************
--��ʯ����
--**********************************
function x300053_BaoShi(sceneId,selfId)
	if GetNumText()==300 then
		BeginEvent(sceneId)
			AddText(sceneId, "#G    ����ʯ��ع��ܼ��ϡ����Ϊ���һ������װ��ȫ�����ף��ǳ�������ҡ�(ֻ����һ�Σ����谴��)")
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff��Ҫ���     #cFF0000������һ�����ס�", 5, 301)
			AddNumText(sceneId, x300053_g_scriptId,"#cff0000���޴��     #R��װ���Ŀ״��졿", 5, 302)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff��ʯ�ϳ�     #R���ͼ��ϳɸ߼���", 5, 303)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff��ʯ��Ƕ     #R��װ����Ƕ��ʯ��", 5, 306)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff��ʯժ��     #R��ժ��װ����ʯ��", 5, 304)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff���Ϻϳ�     #R�����Ϻϳɹ��ܡ�", 5, 305)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff��ʯ����     #R����ʯ�������ܡ�", 5, 307)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff��ʯ����     #R���߽ױ�ʯ������", 5, 308)
			--AddNumText(sceneId, x300053_g_scriptId,"#g3f3ffftest", 5, 309)
			AddNumText(sceneId, x300053_g_scriptId,"#R������ҳ", 8, 8888)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif GetNumText()==301 then
		local tEquipGemTable = { 0, 1, 2, 3, 4, 5, 6, 7, 12, 14, 15 ,8,17 }--8,����,17����
		local bagbegin = GetBasicBagStartPos(sceneId, selfId)
		local bagend = GetBasicBagEndPos(sceneId, selfId)		
		for i=bagbegin, bagend do
			local itemIndex = LuaFnGetItemTableIndexByIndex( sceneId, selfId, i )			
			if itemIndex>0 then
				local ret = LuaFnIsItemLocked( sceneId, selfId, i )
				if ret ~= 0 then
					return
				end	
				local EquipType = LuaFnGetBagEquipType( sceneId, selfId, i )				
				local find = 0
				for j, gem in tEquipGemTable do
					if gem == EquipType then
						find = 1
					end
				end
				if find == 1 then	
					local equipMaxGemCount = GetBagGemCount( sceneId, selfId, i )					
					while equipMaxGemCount<3 do				
						local ret = AddBagItemSlot( sceneId, selfId, i )
						equipMaxGemCount = GetBagGemCount( sceneId, selfId, i )			
					end
				end
			end
		end
		x300053_MsgBox( sceneId, selfId, "#Y    ��ϲ���������������е�װ������ȫ���ɹ���׵�[#R3#Y]��" )
	elseif GetNumText()==302 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		UICommand_AddInt( sceneId, 1 )--type�����֮��
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 75117 )
	elseif GetNumText()==303 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 23 )
	elseif GetNumText()==304 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 27 )
	elseif GetNumText()==305 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19810424 )
	elseif GetNumText()==306 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19830424 )
	elseif GetNumText()==307 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 112236 )
	elseif GetNumText()==308 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 112237 )
	elseif GetNumText()==309 then
		CallScriptFunction( 380002, "OnDefaultEvent", sceneId, selfId )
	end
end

--**********************************
--������
--**********************************
function x300053_SuiShen(sceneId,selfId)
	if GetNumText() == 100 then
		BeginEvent(sceneId)
			AddText(sceneId, "#G    [��ȡԪ��]��ȷ������Ԫ��ά����2000�����£������п��ܻ�����޷����ߵ��������ʹ��������ȡ��")
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff��ҪԪ��     #R��������ȡԪ����", 5, 101)			
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff����һ�     #R����Ҷһ����㡿", 7, 120)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff���_�y��     #R��Զ������ֿ⡿", 7, 102)
			--AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff�����ķ�     #R�������ķ�������", 12, 7777)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff��ȡ����     #R����ȡ�弶������", 12, 130)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff��������     #R�����鲻�����á�", 12, 104)
			AddNumText(sceneId, x300053_g_scriptId,"#cff0000ʱװȾɫ     #cff0000������ʱװȾɫ��", 12, 106)
			--AddNumText(sceneId, x300053_g_scriptId,"#cff0000Test     #cff0000��Test��", 12, 107)
			AddNumText(sceneId, x300053_g_scriptId,"#cff0000�������     #R����ʱ���״̬��", 5, 108)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff�鿴����     #R��������߹��桿", 12, 103)
			AddNumText(sceneId, x300053_g_scriptId,"#R������ҳ", 8, 8888)			
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif GetNumText() == 108  then
		LuaFnCancelSpecificImpact(sceneId,selfId,113)
		LuaFnCancelSpecificImpact(sceneId,selfId,200)
		LuaFnCancelSpecificImpact(sceneId,selfId,33815)
		x300053_CloseMe(sceneId, selfId)
	elseif GetNumText() == 107  then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, 0 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  20111202)
	elseif GetNumText() == 106  then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  0910281)
	elseif GetNumText() == 105  then
		BeginEvent( sceneId )
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
			for i = 0,1000  do
				AddExp(sceneId,selfId,GetExp(sceneId,selfId)*-1)
			end
			AddText(sceneId,"��ϲ�����Ѿ��ɹ�Ϊ������˾��飡")
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, -1 )
	elseif GetNumText() == 104  then
		BeginEvent( sceneId )
		AddText( sceneId, "��������߸�ĳЩ��Ҿ�����ָ��������������Ҳ�Ҫ���澭�飬�����˾����õ�����Ҫ�Ѿ���浽����ȥ���ͳ��ָ���������ˡ�" )
		AddNumText(sceneId, x300053_g_scriptId, "�ǵģ���Ҫ���㡣", 12, 105 )
		AddNumText(sceneId, x300053_g_scriptId,"�ҵ����", 8, 8888)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, -1 )
	elseif GetNumText() == 101  then
		local getYB=500000;
		--ZengDian(sceneId,selfId,targetId,1,getYB)
		YuanBao(sceneId,selfId,targetId,1,getYB)
		x300053_Tips( sceneId, selfId, "��ϲ�㣬�ɹ���ȡ "..getYB.." Ԫ����" )
		x300053_CloseMe(sceneId, selfId)
	elseif GetNumText() == 102  then
		if sceneId==0 or sceneId==1 or sceneId==2 or sceneId==186 then
			BankBegin(sceneId, selfId, selfId)				
		else
			x300053_Tips( sceneId, selfId, "ֻ�����ǵ�ͼ�ſ�����Զ������" )
			x300053_CloseMe(sceneId, selfId)
		end		
	elseif GetNumText() == 103  then
		CallScriptFunction( 380002, "OnDefaultEvent", sceneId, selfId )
	elseif GetNumText() == 120  then
		BeginEvent(sceneId)
			AddText(sceneId,"#G    ��������������������ϵĽ�Ҷһ����������㣬�һ�����Ϊ #r#e6f00c7#g3f3fff[#R#{_MONEY10000}#g3f3fff]:[#R10#g3f3fff����]")
			AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff��ʼ�һ�", 5, 121 )
			AddNumText( sceneId, x300053_g_scriptId, "�´�����", 8, 9999 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif GetNumText() == 121  then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 5430 )
	elseif GetNumText() == 130  then
		BeginEvent(sceneId)
			AddText(sceneId,"    #G���������ȡ�ȼ�����������ﵽ���µȼ����Ϳ���ѡ������ѡ��ѡ��������л����֧�֣�ף����Ϸ��죡")
			AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff��ȡ80������      #gFF3E96[5W]����", 5, 131 )
			ddNumText( sceneId, x300053_g_scriptId, "#g3f3fff��ȡ100������     #gFF3E96[10W]����", 5, 132 )
		       AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff��ȡ130������     #gFF3E96[15W]����", 5, 133 )
			AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff��ȡ140������     #gFF3E96[20W]����", 5, 134 )
			AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff��ȡ150������     #gFF3E96[30W]����", 5, 135 )
			--AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff��ȡ160������     #gFF3E96[50W]����", 5, 136 )
			--AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff��ȡ170������     #gFF3E96[60W]����", 5, 137 )
			--AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff��ȡ180������     #gFF3E96[70W]����", 5, 138 )
			--AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff��ȡ190������     #gFF3E96[80W]����", 5, 139 )
			--AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff��ȡ200������     #gFF3E96[90W]����", 5, 140 )
			--AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff��ȡ210������     #gFF3E96[100W]����", 5, 141 )
			--AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff��ȡ220������     #gFF3E96[200W]����", 5, 142 )
			--AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff��ȡ230������     #gFF3E96[300W]����", 5, 143 )
			--AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff��ȡ240������     #gFF3E96[400W]����", 5, 144 )
			--AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff��ȡ250������     #gFF3E96[500W]����", 5, 145 )
			AddNumText(sceneId, x300053_g_scriptId,"#R������ҳ", 8, 8888)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif GetNumText() == 145  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<250 then
			x300053_Tips( sceneId, selfId, "���ĵȼ���������ﵽ250�����������ҡ�" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL250 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "������˼�����Ѿ���ȡ���ý�����" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,5000000)
			SetMissionData( sceneId, selfId, DANJIAN_JL250, 1 )
			x300053_Tips( sceneId, selfId, "��ϲ�����ɹ���ȡ250������: #G[500W] ����#W����л����֧�֣�ף����Ϸ��죡" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 144  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<240 then
			x300053_Tips( sceneId, selfId, "���ĵȼ���������ﵽ240�����������ҡ�" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL240 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "������˼�����Ѿ���ȡ���ý�����" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,4000000)
			SetMissionData( sceneId, selfId, DANJIAN_JL240, 1 )
			x300053_Tips( sceneId, selfId, "��ϲ�����ɹ���ȡ240������: #G[400W] ����#W����л����֧�֣�ף����Ϸ��죡" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 143  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<230 then
			x300053_Tips( sceneId, selfId, "���ĵȼ���������ﵽ230�����������ҡ�" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL230 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "������˼�����Ѿ���ȡ���ý�����" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,3000000)
			SetMissionData( sceneId, selfId, DANJIAN_JL230, 1 )
			x300053_Tips( sceneId, selfId, "��ϲ�����ɹ���ȡ230������: #G[300W] ����#W����л����֧�֣�ף����Ϸ��죡" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 142  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<220 then
			x300053_Tips( sceneId, selfId, "���ĵȼ���������ﵽ220�����������ҡ�" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL220 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "������˼�����Ѿ���ȡ���ý�����" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,2000000)
			SetMissionData( sceneId, selfId, DANJIAN_JL220, 1 )
			x300053_Tips( sceneId, selfId, "��ϲ�����ɹ���ȡ220������: #G[200W] ����#W����л����֧�֣�ף����Ϸ��죡" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 141  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<210 then
			x300053_Tips( sceneId, selfId, "���ĵȼ���������ﵽ210�����������ҡ�" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL210 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "������˼�����Ѿ���ȡ���ý�����" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,1000000)
			SetMissionData( sceneId, selfId, DANJIAN_JL210, 1 )
			x300053_Tips( sceneId, selfId, "��ϲ�����ɹ���ȡ210������: #G[100W] ����#W����л����֧�֣�ף����Ϸ��죡" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 140  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<200 then
			x300053_Tips( sceneId, selfId, "���ĵȼ���������ﵽ200�����������ҡ�" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL200 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "������˼�����Ѿ���ȡ���ý�����" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,900000)
			SetMissionData( sceneId, selfId, DANJIAN_JL200, 1 )
			x300053_Tips( sceneId, selfId, "��ϲ�����ɹ���ȡ200������: #G[90W] ����#W����л����֧�֣�ף����Ϸ��죡" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 139  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<190 then
			x300053_Tips( sceneId, selfId, "���ĵȼ���������ﵽ190�����������ҡ�" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL190 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "������˼�����Ѿ���ȡ���ý�����" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,800000)
			SetMissionData( sceneId, selfId, DANJIAN_JL190, 1 )
			x300053_Tips( sceneId, selfId, "��ϲ�����ɹ���ȡ190������: #G[80W] ����#W����л����֧�֣�ף����Ϸ��죡" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 138  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<180 then
			x300053_Tips( sceneId, selfId, "���ĵȼ���������ﵽ180�����������ҡ�" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL180 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "������˼�����Ѿ���ȡ���ý�����" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,700000)
			SetMissionData( sceneId, selfId, DANJIAN_JL180, 1 )
			x300053_Tips( sceneId, selfId, "��ϲ�����ɹ���ȡ180������: #G[70W] ����#W����л����֧�֣�ף����Ϸ��죡" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 137  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<170 then
			x300053_Tips( sceneId, selfId, "���ĵȼ���������ﵽ170�����������ҡ�" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL170 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "������˼�����Ѿ���ȡ���ý�����" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,600000)
			SetMissionData( sceneId, selfId, DANJIAN_JL170, 1 )
			x300053_Tips( sceneId, selfId, "��ϲ�����ɹ���ȡ170������: #G[60W] ����#W����л����֧�֣�ף����Ϸ��죡" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 136  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<160 then
			x300053_Tips( sceneId, selfId, "���ĵȼ���������ﵽ160�����������ҡ�" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL160 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "������˼�����Ѿ���ȡ���ý�����" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,500000)
			SetMissionData( sceneId, selfId, DANJIAN_JL160, 1 )
			x300053_Tips( sceneId, selfId, "��ϲ�����ɹ���ȡ160������: #G[50W] ����#W����л����֧�֣�ף����Ϸ��죡" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 135  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<149 then
			x300053_Tips( sceneId, selfId, "���ĵȼ���������ﵽ150�����������ҡ�" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL150 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "������˼�����Ѿ���ȡ���ý�����" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,300000)
			SetMissionData( sceneId, selfId, DANJIAN_JL150, 1 )
			x300053_Tips( sceneId, selfId, "��ϲ�����ɹ���ȡ150������: #G[30W] ����#W����л����֧�֣�ף����Ϸ��죡" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 134  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<140 then
			x300053_Tips( sceneId, selfId, "���ĵȼ���������ﵽ140�����������ҡ�" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL140 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "������˼�����Ѿ���ȡ���ý�����" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,200000)
			SetMissionData( sceneId, selfId, DANJIAN_JL140, 1 )
			x300053_Tips( sceneId, selfId, "��ϲ�����ɹ���ȡ140������: #G[20W] ����#W����л����֧�֣�ף����Ϸ��죡" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 133  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<130 then
			x300053_Tips( sceneId, selfId, "���ĵȼ���������ﵽ130�����������ҡ�" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL130 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "������˼�����Ѿ���ȡ���ý�����" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,150000)
			SetMissionData( sceneId, selfId, DANJIAN_JL130, 1 )
			x300053_Tips( sceneId, selfId, "��ϲ�����ɹ���ȡ130������: #G[15W] ����#W����л����֧�֣�ף����Ϸ��죡" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 132  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<100 then
			x300053_Tips( sceneId, selfId, "���ĵȼ���������ﵽ100�����������ҡ�" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL100 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "������˼�����Ѿ���ȡ���ý�����" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,100000)
			SetMissionData( sceneId, selfId, DANJIAN_JL100, 1 )
			x300053_Tips( sceneId, selfId, "��ϲ�����ɹ���ȡ100������: #G[10W] ����#W����л����֧�֣�ף����Ϸ��죡" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 131  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<80 then
			x300053_Tips( sceneId, selfId, "���ĵȼ���������ﵽ80�����������ҡ�" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL80 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "������˼�����Ѿ���ȡ���ý�����" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,50000)
			SetMissionData( sceneId, selfId, DANJIAN_JL80, 1 )
			x300053_Tips( sceneId, selfId, "��ϲ�����ɹ���ȡ80������: #G[5W] ����#W����л����֧�֣�ף����Ϸ��죡" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 132  then
		
	end
end

--**********************************
--�������ɽ�����Ʒ
--**********************************
function x300053_JiaRuMenPaiAddItem(sceneId,selfId,menpaiId)
	local qishu=0
	local zuoqi=0
	if menpaiId ==0 then
		qishu=30308081
		zuoqi=10470107
	elseif menpaiId ==1 then
		qishu=30308080
		zuoqi=10149029
	elseif menpaiId ==2 then
		qishu=30308079
		zuoqi=10149025
	elseif menpaiId ==3 then
		qishu=30308084
		zuoqi=10149023
	elseif menpaiId ==4 then
		qishu=30308078
		zuoqi=10149022
	elseif menpaiId ==5 then
		qishu=30308086
		zuoqi=10149028
	elseif menpaiId ==6 then
		qishu=30308082
		zuoqi=10149027
	elseif menpaiId ==7 then
		qishu=30308083
		zuoqi=10149021
	elseif menpaiId ==8 then
		qishu=30308085
		zuoqi=10149026
	elseif menpaiId ==9 then
		qishu=39920006
		zuoqi=10149035
	end
	BeginAddItem(sceneId)
		AddItem( sceneId, qishu, 1 )
		AddItem( sceneId, zuoqi, 1 )
	EndAddItem(sceneId,selfId)
	AddItemListToHuman(sceneId,selfId)
end

--**********************************
--�������ɼ��
--**********************************
function x300053_CheckJiaRuMenPai(sceneId,selfId)
	local index =	GetMissionData( sceneId, selfId, MY_JIARUMENPAI )
	if index ==0 then
		return 1
	else
		if LuaFnGetAvailableItemCount(sceneId, selfId, 40004475) >= 1 then
			return 1
		else
			x300053_MsgBox( sceneId, selfId, "    #Y�Բ������Ѿ���������ɣ�����������ɣ���ǰ��Ԫ���̵깺��#G���ɸ�����#Y��" )
			return 0
		end
	end
	
end

--**********************************
--��������
--**********************************
function x300053_JiaRuMenPai(sceneId,selfId,key)
	if key==0 then
		key=GetNumText()
	end
	if key == 200 then
		BeginEvent( sceneId )
			AddText(sceneId,"�װ�����ң����ã�")
			AddText( sceneId, "    #Y�������������ķ�150������������ Ԫ���̵�-������-��갵��-����#R����ת����" )
			AddNumText( sceneId, x300053_g_scriptId, "   #g3f3fffĽ��",3,201 )
			AddNumText( sceneId, x300053_g_scriptId, "   #g3f3fff����",3,202 )
			AddNumText( sceneId, x300053_g_scriptId, "   #g3f3fff��ң",3,203 )
			AddNumText( sceneId, x300053_g_scriptId, "   #g3f3fff����",3,204 )
			AddNumText( sceneId, x300053_g_scriptId, "   #g3f3fff��ɽ",3,205 )
			AddNumText( sceneId, x300053_g_scriptId, "   #g3f3fff����",3,206 )		
			AddNumText( sceneId, x300053_g_scriptId, "   #g3f3fff�䵱",3,207 )
			AddNumText( sceneId, x300053_g_scriptId, "   #g3f3fff����",3,208 )
			AddNumText( sceneId, x300053_g_scriptId, "   #g3f3fffؤ��",3,209 )
			AddNumText( sceneId, x300053_g_scriptId, "   #g3f3fff��ü",3,210 )
			AddNumText(sceneId, x300053_g_scriptId,"#R������ҳ", 8, 8888)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, -1 )
	elseif key == 201  then
		if x300053_CheckJiaRuMenPai(sceneId,selfId) == 1 then
			LuaFnJoinMenpai(sceneId, selfId, selfId, 9)
			LuaFnSetXinFaLevel(sceneId,selfId,64,150)
			LuaFnSetXinFaLevel(sceneId,selfId,65,150)
			LuaFnSetXinFaLevel(sceneId,selfId,66,150)
			LuaFnSetXinFaLevel(sceneId,selfId,67,150)
			LuaFnSetXinFaLevel(sceneId,selfId,68,150)
			LuaFnSetXinFaLevel(sceneId,selfId,69,150)
			LuaFnSetXinFaLevel(sceneId,selfId,70,150)
			LuaFnSetXinFaLevel(sceneId,selfId,71,150)
			AddSkill(  sceneId, selfId, 200)
			x300053_JiaRuMenPaiAddItem(sceneId,selfId,9)
			LuaFnDelAvailableItem(sceneId,selfId,39910006,1)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			SetMissionData(sceneId, selfId, MY_JIARUMENPAI, 1);			
			x300053_MsgBox( sceneId, selfId, "#Y��ϲ�����ɹ����������ɣ�ף����Ϸ��졣" )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #Bͨ�������ֿ��ˣ�������#GĽ������#B���£��������ļ��룬 #GĽ������#B��֮ǰ��Ϊǿ���ˣ�", 4 )	
		end
	elseif key == 202  then
		if x300053_CheckJiaRuMenPai(sceneId,selfId) == 1 then
			LuaFnJoinMenpai(sceneId, selfId, selfId, 5)
			LuaFnSetXinFaLevel(sceneId,selfId,31,150)
			LuaFnSetXinFaLevel(sceneId,selfId,32,150)
			LuaFnSetXinFaLevel(sceneId,selfId,33,150)
			LuaFnSetXinFaLevel(sceneId,selfId,34,150)
			LuaFnSetXinFaLevel(sceneId,selfId,35,150)
			LuaFnSetXinFaLevel(sceneId,selfId,36,150)
			LuaFnSetXinFaLevel(sceneId,selfId,60,150)
			LuaFnSetXinFaLevel(sceneId,selfId,77,150)
			AddSkill(  sceneId, selfId, 28)
			x300053_JiaRuMenPaiAddItem(sceneId,selfId,5)
			LuaFnDelAvailableItem(sceneId,selfId,39910006,1)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			SetMissionData(sceneId, selfId, MY_JIARUMENPAI, 1);
			x300053_MsgBox( sceneId, selfId, "#Y��ϲ�����ɹ����������ɣ�ף����Ϸ��졣" )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #Bͨ�������ֿ��ˣ�������#G����#B���£��������ļ��룬 #G����#B��֮ǰ��Ϊǿ���ˣ�", 4 )
		end
	elseif key == 203  then
		if x300053_CheckJiaRuMenPai(sceneId,selfId) == 1 then
			LuaFnJoinMenpai(sceneId, selfId, selfId, 8)
			LuaFnSetXinFaLevel(sceneId,selfId,49,150)
			LuaFnSetXinFaLevel(sceneId,selfId,50,150)
			LuaFnSetXinFaLevel(sceneId,selfId,51,150)
			LuaFnSetXinFaLevel(sceneId,selfId,52,150)
			LuaFnSetXinFaLevel(sceneId,selfId,53,150)
			LuaFnSetXinFaLevel(sceneId,selfId,54,150)
			LuaFnSetXinFaLevel(sceneId,selfId,63,150)
			LuaFnSetXinFaLevel(sceneId,selfId,80,150)
			AddSkill(  sceneId, selfId, 31)
			x300053_JiaRuMenPaiAddItem(sceneId,selfId,8)
			LuaFnDelAvailableItem(sceneId,selfId,39910006,1)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			SetMissionData(sceneId, selfId, MY_JIARUMENPAI, 1);
			x300053_MsgBox( sceneId, selfId, "#Y��ϲ�����ɹ����������ɣ�ף����Ϸ��졣" )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #Bͨ�������ֿ��ˣ�������#G��ң#B���£��������ļ��룬 #G��ң#B��֮ǰ��Ϊǿ���ˣ�", 4 )
		end
	elseif key == 204  then
		if x300053_CheckJiaRuMenPai(sceneId,selfId) == 1 then
			LuaFnJoinMenpai(sceneId, selfId, selfId, 0)
			LuaFnSetXinFaLevel(sceneId,selfId,1,150)
			LuaFnSetXinFaLevel(sceneId,selfId,2,150)
			LuaFnSetXinFaLevel(sceneId,selfId,3,150)
			LuaFnSetXinFaLevel(sceneId,selfId,4,150)
			LuaFnSetXinFaLevel(sceneId,selfId,5,150)
			LuaFnSetXinFaLevel(sceneId,selfId,6,150)
			LuaFnSetXinFaLevel(sceneId,selfId,55,150)
			LuaFnSetXinFaLevel(sceneId,selfId,72,150)
			AddSkill(  sceneId, selfId, 23)
			x300053_JiaRuMenPaiAddItem(sceneId,selfId,0)
			LuaFnDelAvailableItem(sceneId,selfId,39910006,1)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			SetMissionData(sceneId, selfId, MY_JIARUMENPAI, 1);
			x300053_MsgBox( sceneId, selfId, "#Y��ϲ�����ɹ����������ɣ�ף����Ϸ��졣" )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #Bͨ�������ֿ��ˣ�������#G����#B���£��������ļ��룬 #G����#B��֮ǰ��Ϊǿ���ˣ�", 4 )
		end
	elseif key == 205  then
		if x300053_CheckJiaRuMenPai(sceneId,selfId) == 1 then
			LuaFnJoinMenpai(sceneId, selfId, selfId, 7)
			LuaFnSetXinFaLevel(sceneId,selfId,43,150)
			LuaFnSetXinFaLevel(sceneId,selfId,44,150)
			LuaFnSetXinFaLevel(sceneId,selfId,45,150)
			LuaFnSetXinFaLevel(sceneId,selfId,46,150)
			LuaFnSetXinFaLevel(sceneId,selfId,47,150)
			LuaFnSetXinFaLevel(sceneId,selfId,48,150)
			LuaFnSetXinFaLevel(sceneId,selfId,62,150)
			LuaFnSetXinFaLevel(sceneId,selfId,79,150)
			AddSkill(  sceneId, selfId, 30)
			x300053_JiaRuMenPaiAddItem(sceneId,selfId,7)
			LuaFnDelAvailableItem(sceneId,selfId,39910006,1)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			SetMissionData(sceneId, selfId, MY_JIARUMENPAI, 1);
			x300053_MsgBox( sceneId, selfId, "#Y��ϲ�����ɹ����������ɣ�ף����Ϸ��졣" )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #Bͨ�������ֿ��ˣ�������#G��ɽ#B���£��������ļ��룬 #G��ɽ#B��֮ǰ��Ϊǿ���ˣ�", 4 )
		end
	elseif key == 206  then
		if x300053_CheckJiaRuMenPai(sceneId,selfId) == 1 then
			LuaFnJoinMenpai(sceneId, selfId, selfId, 6)
			LuaFnSetXinFaLevel(sceneId,selfId,37,150)
			LuaFnSetXinFaLevel(sceneId,selfId,38,150)
			LuaFnSetXinFaLevel(sceneId,selfId,39,150)
			LuaFnSetXinFaLevel(sceneId,selfId,40,150)
			LuaFnSetXinFaLevel(sceneId,selfId,41,150)
			LuaFnSetXinFaLevel(sceneId,selfId,42,150)
			LuaFnSetXinFaLevel(sceneId,selfId,61,150)
			LuaFnSetXinFaLevel(sceneId,selfId,78,150)
			AddSkill(  sceneId, selfId, 29)
			x300053_JiaRuMenPaiAddItem(sceneId,selfId,6)
			LuaFnDelAvailableItem(sceneId,selfId,39910006,1)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			SetMissionData(sceneId, selfId, MY_JIARUMENPAI, 1);
			x300053_MsgBox( sceneId, selfId, "#Y��ϲ�����ɹ����������ɣ�ף����Ϸ��졣" )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #Bͨ�������ֿ��ˣ�������#G����#B���£��������ļ��룬 #G����#B��֮ǰ��Ϊǿ���ˣ�", 4 )
		end
	elseif key == 207  then
		if x300053_CheckJiaRuMenPai(sceneId,selfId) == 1 then
			LuaFnJoinMenpai(sceneId, selfId, selfId, 3)
			LuaFnSetXinFaLevel(sceneId,selfId,19,150)
			LuaFnSetXinFaLevel(sceneId,selfId,20,150)
			LuaFnSetXinFaLevel(sceneId,selfId,21,150)
			LuaFnSetXinFaLevel(sceneId,selfId,22,150)
			LuaFnSetXinFaLevel(sceneId,selfId,23,150)
			LuaFnSetXinFaLevel(sceneId,selfId,24,150)
			LuaFnSetXinFaLevel(sceneId,selfId,58,150)
			LuaFnSetXinFaLevel(sceneId,selfId,75,150)
			AddSkill(  sceneId, selfId, 26)
			x300053_JiaRuMenPaiAddItem(sceneId,selfId,3)
			LuaFnDelAvailableItem(sceneId,selfId,39910006,1)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			SetMissionData(sceneId, selfId, MY_JIARUMENPAI, 1);
			x300053_MsgBox( sceneId, selfId, "#Y��ϲ�����ɹ����������ɣ�ף����Ϸ��졣" )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #Bͨ�������ֿ��ˣ�������#G�䵱#B���£��������ļ��룬 #G�䵱#B��֮ǰ��Ϊǿ���ˣ�", 4 )
		end
	elseif key == 208  then
		if x300053_CheckJiaRuMenPai(sceneId,selfId) == 1 then
			LuaFnJoinMenpai(sceneId, selfId, selfId, 1)
			LuaFnSetXinFaLevel(sceneId,selfId,7,150)
			LuaFnSetXinFaLevel(sceneId,selfId,8,150)
			LuaFnSetXinFaLevel(sceneId,selfId,9,150)
			LuaFnSetXinFaLevel(sceneId,selfId,10,150)
			LuaFnSetXinFaLevel(sceneId,selfId,11,150)
			LuaFnSetXinFaLevel(sceneId,selfId,12,150)
			LuaFnSetXinFaLevel(sceneId,selfId,56,150)
			LuaFnSetXinFaLevel(sceneId,selfId,73,150)
			AddSkill(  sceneId, selfId, 24)
			x300053_JiaRuMenPaiAddItem(sceneId,selfId,1)
			LuaFnDelAvailableItem(sceneId,selfId,39910006,1)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			SetMissionData(sceneId, selfId, MY_JIARUMENPAI, 1);
			x300053_MsgBox( sceneId, selfId, "#Y��ϲ�����ɹ����������ɣ�ף����Ϸ��졣" )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #Bͨ�������ֿ��ˣ�������#G����#B���£��������ļ��룬 #G����#B��֮ǰ��Ϊǿ���ˣ�", 4 )
		end
	elseif key == 209  then
		if x300053_CheckJiaRuMenPai(sceneId,selfId) == 1 then
			LuaFnJoinMenpai(sceneId, selfId, selfId, 2)
			LuaFnSetXinFaLevel(sceneId,selfId,13,150)
			LuaFnSetXinFaLevel(sceneId,selfId,14,150)
			LuaFnSetXinFaLevel(sceneId,selfId,15,150)
			LuaFnSetXinFaLevel(sceneId,selfId,16,150)
			LuaFnSetXinFaLevel(sceneId,selfId,17,150)
			LuaFnSetXinFaLevel(sceneId,selfId,18,150)
			LuaFnSetXinFaLevel(sceneId,selfId,57,150)
			LuaFnSetXinFaLevel(sceneId,selfId,74,150)
			AddSkill(  sceneId, selfId, 25)
			x300053_JiaRuMenPaiAddItem(sceneId,selfId,2)
			LuaFnDelAvailableItem(sceneId,selfId,39910006,1)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			SetMissionData(sceneId, selfId, MY_JIARUMENPAI, 1);
			x300053_MsgBox( sceneId, selfId, "#Y��ϲ�����ɹ����������ɣ�ף����Ϸ��졣" )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #Bͨ�������ֿ��ˣ�������#Gؤ��#B���£��������ļ��룬 #Gؤ��#B��֮ǰ��Ϊǿ���ˣ�", 4 )
		end
	elseif key == 210  then
		if x300053_CheckJiaRuMenPai(sceneId,selfId) == 1 then
			LuaFnJoinMenpai(sceneId, selfId, selfId, 4)
			LuaFnSetXinFaLevel(sceneId,selfId,25,150)
			LuaFnSetXinFaLevel(sceneId,selfId,26,150)
			LuaFnSetXinFaLevel(sceneId,selfId,27,150)
			LuaFnSetXinFaLevel(sceneId,selfId,28,150)
			LuaFnSetXinFaLevel(sceneId,selfId,29,150)
			LuaFnSetXinFaLevel(sceneId,selfId,30,150)
			LuaFnSetXinFaLevel(sceneId,selfId,59,150)
			LuaFnSetXinFaLevel(sceneId,selfId,76,150)
			AddSkill(  sceneId, selfId, 27)
			x300053_JiaRuMenPaiAddItem(sceneId,selfId,4)
			LuaFnDelAvailableItem(sceneId,selfId,39910006,1)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			SetMissionData(sceneId, selfId, MY_JIARUMENPAI, 1);
			x300053_MsgBox( sceneId, selfId, "#Y��ϲ�����ɹ����������ɣ�ף����Ϸ��졣" )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #Bͨ�������ֿ��ˣ�������#G��ü#B���£��������ļ��룬 #G��ü#B��֮ǰ��Ϊǿ���ˣ�", 4 )
		end
	end
end
--**********************************
--�һ�����
--**********************************
function x300053_GoldToZD( sceneId, selfId, toZDNum)
	local needMoney=toZDNum*1000;
	local	SelfMoney = GetMoney(sceneId, selfId)
	if SelfMoney<needMoney then
		local sMessage = format("#Y    ��Ǯ���㣬���顣")
		x399999_MsgBox( sceneId, selfId, sMessage )
		return
	end
	local reply = CostMoney(sceneId,selfId,needMoney)
	if reply == -1 then
		local sMessage = format("#Y    ��Ǯ���㣬���顣")
		x399999_MsgBox( sceneId, selfId, sMessage )
		return
	else
		local result =	ZengDian(sceneId,selfId,targetId,1,toZDNum)
		local sMessage = format("#Y��ϲ���һ��ɹ���#r������ [#R#{_MONEY%d}#Y]#r����� [#R%d����]",needMoney,toZDNum)
		x399999_MsgBox( sceneId, selfId, sMessage )
	end
end
--**********************************
--�ķ�ѧϰ�����ѧϰ��ť
--**********************************
function x300053_MRXinFa(sceneId,selfId,xinfaId,money,exp)
	if GetExp(sceneId,selfId) < exp  then
		x300053_Tips( sceneId, selfId, "���鲻�㣬���飡" )
		return
	elseif GetMoney(sceneId, selfId) < money  then
		x300053_Tips( sceneId, selfId, "��Ǯ���㣬���飡" )
		return
	end
	local reply = CostMoney(sceneId,selfId,money)
	if reply ~= -1 then
		local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, selfId, xinfaId) + 1
		LuaFnAddExp(sceneId,selfId,0-exp)
		LuaFnSetXinFaLevel(sceneId,selfId,xinfaId,nXinfaLevel)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 151, 0)
		--x300053_Tips( sceneId, selfId, nXinfaLevel.." ���ķ�ѧϰ�ɹ�!" )	
		DispatchXinfaLevelInfo( sceneId, selfId, selfId, 10 );
	end
end

--**********************************
--�ķ�ѧϰ
--**********************************
function x300053_XinFa(sceneId,selfId)
	DispatchXinfaLevelInfo( sceneId, selfId, selfId, 10 );
end
