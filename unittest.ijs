require 'general/unittest/base'

coclass 'pUnitRun'

attr_ignore=: 4 : 0
  if. 0~:4!:0<a=. cofullname__x y,'_ignore'do.0 return.end.
  if. a~ do.1 return.else.0 return.end.
)

attr_expect=: 4 : 0
  if. 0~:4!:0<a=. cofullname__x y,'_expect'do.''return.end.
  a~
)

errNum=: 13!:11
errMsg=: 13!:12
ERR_NAMES=: 9!:8''

unittest=: 3 : 0
  r=. 'Test: ',y,LF
  c=. conew 'pUnitBase'
  try.
    script__c y
    
    before_all__c''
    tl=. 'test_'nl__c''
    for_tb. tl do.
      t=. 5}.> tb
      if. c attr_ignore t do.
        r=. r,t,': Ignored',LF
      else.
        v=. cofullname__c > 'test_',t
        try.
          before_each__c t
          v~''
          after_each__c t
          r=. r,t,': OK',LF
        catch.
          e=. (_1+errNum''){::ERR_NAMES
          if. e -: c attr_expect t do.
            r=. r,t,': OK',LF
          else.
            r=. r,t,': Error',LF,errMsg''
          end.
        end.
      end.
    end.
    after_all__c''
  catch.
    r=. r,LF,'/!\ Critical Error:',LF,(errMsg''),LF
  end.
  codestroy__c''
  r
)

unittest_z_=: unittest_pUnitRun_

Note 'demo'
  unittest jpath '~addons/general/unittest/demo/one_test.ijs'
  unittest jpath '~addons/general/unittest/demo/two_test.ijs'
)
