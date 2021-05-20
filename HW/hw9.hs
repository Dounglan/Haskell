--Dounglan Cheung
--dcheun01@syr.edu
--HW9
--11.13.19 
import Turing

--ex1
--counts how many "hwhh" in a string and puts 1 at the end of string
hwhhTM :: Prog
hwhhTM = [ 
            (("start", 'w'),('w',Rght,"start")),
            (("start",'h'),('h',Rght,"sawH")),

            (("sawH",'h'),('h',Rght,"sawH")),
            (("sawH",'w'),('w',Rght,"sawHW")),
            
            (("sawHW",'w'),('w',Rght,"start")),
            (("sawHW",'h'),('h',Rght,"sawHWH")),
            
            (("sawHWH",'w'),('w',Rght,"start")),
            (("sawHWH",'h'),('X',Rght,"findEnd")),
            
            (("findEnd",'w'),('w',Rght,"findEnd")),
            (("findEnd",'h'),('h',Rght,"findEnd")),
            (("findEnd",'1'),('1',Rght,"findEnd")),
            (("findEnd",' '),('1',Lft,"goBack")),
            
            (("goBack",'1'),('1',Lft,"goBack")),
            (("goBack",'h'),('h',Lft,"goBack")),
            (("goBack",'w'),('w',Lft,"goBack")),
            (("goBack",'X'),('h',Rght,"sawH"))
          ] 
--ex2
--checks the total number of ks and qs is divisible by 4
div4 :: Prog
div4 = [
             (("rem0",'m'),(' ',Rght,"rem0")),
             (("rem0",'k'),(' ',Rght,"rem1")),
             (("rem0",'q'),(' ',Rght,"rem1")),
             (("rem0",' '),('Y',Rght,"done")),

             (("rem1",'m'),(' ',Rght,"rem1")),
             (("rem1",'k'),(' ',Rght,"rem2")),
             (("rem1",'q'),(' ',Rght,"rem2")),
             (("rem1",' '),('N',Rght,"done")),

             (("rem2",'m'),(' ',Rght,"rem2")),
             (("rem2",'k'),(' ',Rght,"rem3")),
             (("rem2",'q'),(' ',Rght,"rem3")),
             (("rem2",' '),('N',Rght,"done")),

             (("rem3",'m'),(' ',Rght,"rem3")),
             (("rem3",'k'),(' ',Rght,"rem0")),
             (("rem3",'q'),(' ',Rght,"rem0")),
             (("rem3",' '),('N',Rght,"done"))
       ]

--ex3
--orders ds on the left, es on the right
order :: Prog
order = [ 
            (("start", 'd'),('d',Rght,"start")),
            (("start",'e'),('X',Rght,"searchD")),

            (("searchD",'e'),('e',Rght,"searchD")),
            (("searchD",'d'),('e',Lft,"replaceD")),
            (("searchD",' '),(' ',Rght,"findEnd")),
            
            (("replaceD",'d'),('d',Rght,"start")),
            (("replaceD",'e'),('e',Lft,"replaceD")),
            (("replaceD",'X'),('d',Rght,"start")),

            (("findEnd",' '),(' ',Lft,"findEnd")),
            (("findEnd",'e'),('e',Lft,"findEnd")),
            (("findEnd",'1'),('1',Lft,"findEnd")),
            (("findEnd",'X'),('e',Rght,"start"))         
           ]

--ex4
--checks number of 2s and 3s (2s < 3s = F, 3s > 2s = M, 2s == 3s = S)
testEq :: Prog
testEq = [
            (("start", '1'),(' ',Rght,"start")),
            (("start",'2'),(' ',Rght,"search3")),
            (("start",'3'),(' ',Rght,"search2")),
            (("start",'X'),(' ',Rght,"start")),
            (("start",'Y'),(' ',Rght,"start")),
            (("start",' '),('S',Rght,"done")),

            (("search3",'1'),('1',Rght,"search3")),
            (("search3",'2'),('2',Rght,"search3")),
            (("search3",'X'),('X',Rght,"search3")),
            (("search3",'3'),('X',Lft,"goBack")),
            (("search3",' '),('M',Lft,"clean")),
            
            (("search2",'1'),('1',Rght,"search2")),
            (("search2",'3'),('3',Rght,"search2")),
            (("search2",'Y'),('Y',Rght,"search2")),
            (("search2",'2'),('Y',Lft,"goBack")),
            (("search2",' '),('F',Lft,"clean")),

            (("goBack",'1'),('1',Lft,"goBack")),
            (("goBack",'2'),('2',Lft,"goBack")),
            (("goBack",'3'),('3',Lft,"goBack")),
            (("goBack",' '),(' ',Rght,"start")),
            (("goBack",'X'),('X',Lft,"goBack")),
            (("goBack",'Y'),('Y',Lft,"goBack")),
        
            (("clean",'X'),(' ',Lft,"clean")),
            (("clean",'Y'),(' ',Lft,"clean")),
            (("clean",'M'),('M',Lft,"clean")),
            (("clean",'F'),('F',Lft,"clean")),
            (("clean",'S'),('S',Lft,"clean")),
            (("clean",'1'),(' ',Lft,"clean")),
            (("clean",'2'),(' ',Lft,"clean")),
            (("clean",'3'),(' ',Lft,"clean"))
           ]


