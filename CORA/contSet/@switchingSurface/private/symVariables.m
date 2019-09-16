function [x_0,x_c,A,u,t_0,a_s,B_s,C_s,y] = symVariables(varargin)
% symVariables - generates symbolic variables of the switching surface
%
% Syntax:  
%    [t_0,a_s,B_s,C_s] = symVariables(varargin)
%
% Inputs:
%    obj - switching surface object
%    type - defines if 'LR' brackets should be used
%
% Outputs:
%    t_0 - switching time constant
%    a_s - linear switching time parameter
%    B_s - quadratic switching time parameter
%    C_s - cubic switching time parameter
%
% Example: 
%    Text for example...
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: 

% Author:       Matthias Althoff
% Written:      21-August-2013
% Last update:  ---
% Last revision:---

%------------- BEGIN CODE --------------

if nargin==1
    obj=varargin{1};
    type=[];
elseif nargin==2
    obj=varargin{1};
    type=varargin{2};
end


%init
x_0 = sym([]);
x_c = sym([]);
A = sym([]);
u = sym([]);
t_0 = sym([]);
a_s = sym([]);
B_s = sym([]);
C_s = sym([]);
y = sym([]);

if strcmp(type,'LRbrackets')
   
    %x0
    for i=1:obj.dim
        command=['x_0(',num2str(i),',1)=sym(''x_0L',num2str(i),'R'');'];
        eval(command);
    end
    
    %xc
    for i=1:obj.dim
        command=['x_c(',num2str(i),',1)=sym(''x_cL',num2str(i),'R'');'];
        eval(command);
    end
    
    %u
    for i=1:obj.dim
        command=['u(',num2str(i),',1)=sym(''uL',num2str(i),'R'');'];
        eval(command);
    end
    
    %A
    for i=1:obj.dim
        for j=1:obj.dim
            command=['A(',num2str(i),',',num2str(j),')=sym(''AL',num2str(i),'CO',num2str(j),'R'');'];
            eval(command);
        end
    end
    
    %switching time constant
    counter = 1;
    command=['t_0=sym(''yL',num2str(counter),'R'');'];
    eval(command);
    
    %linear switching time parameter
    for i=1:obj.dim
        counter = counter + 1;
        command=['a_s(',num2str(i),',1)=sym(''yL',num2str(counter),'R'');'];
        eval(command);
    end

    if obj.timeOrder>1
        %quadratic switching time parameter
        for i=1:obj.dim
            for j=i:obj.dim
                counter = counter + 1;
                command=['B_s(',num2str(i),',',num2str(j),')=sym(''yL',num2str(counter),'R'');'];
                eval(command);
                %consider symmetric entries
                command=['B_s(',num2str(j),',',num2str(i),')=sym(''yL',num2str(counter),'R'');'];
                eval(command);
            end
        end  
    end
    
    if obj.timeOrder>2
        %cubic switching time parameter
        for i=1:obj.dim
            for j=i:obj.dim
                for k=j:obj.dim
                    counter = counter + 1;
                    command=['C_s(',num2str(i),',',num2str(j),',',num2str(k),')=sym(''yL',num2str(counter),'R'');'];
                    eval(command);
                    %consider symmetric entries
                    command=['C_s(',num2str(i),',',num2str(k),',',num2str(j),')=sym(''yL',num2str(counter),'R'');'];
                    eval(command);
                    %consider symmetric entries
                    command=['C_s(',num2str(j),',',num2str(i),',',num2str(k),')=sym(''yL',num2str(counter),'R'');'];
                    eval(command);
                    %consider symmetric entries
                    command=['C_s(',num2str(j),',',num2str(k),',',num2str(i),')=sym(''yL',num2str(counter),'R'');'];
                    eval(command);
                    %consider symmetric entries
                    command=['C_s(',num2str(k),',',num2str(j),',',num2str(i),')=sym(''yL',num2str(counter),'R'');'];
                    eval(command);
                    %consider symmetric entries
                    command=['C_s(',num2str(k),',',num2str(i),',',num2str(j),')=sym(''yL',num2str(counter),'R'');'];
                    eval(command);
                end
            end
        end
    end
 
    %y
    for i = 1:counter
        command=['y(',num2str(i),')=sym(''yL',num2str(i),'R'');'];
        eval(command);
    end
    
else
    
    %TODO: copy above and remove R, L
    
    %x0
    for i=1:obj.dim
        command=['x_0(',num2str(i),',1)=sym(''x_0(',num2str(i),')'');'];
        eval(command);
    end
    
    %xc
    for i=1:obj.dim
        command=['x_c(',num2str(i),',1)=sym(''x_c(',num2str(i),')'');'];
        eval(command);
    end
    
    %u
    for i=1:obj.dim
        command=['u(',num2str(i),',1)=sym(''u(',num2str(i),')'');'];
        eval(command);
    end
    
    %A
    for i=1:obj.dim
        for j=1:obj.dim
            command=['A(',num2str(i),',',num2str(j),')=sym(''A(',num2str(i),'CO',num2str(j),')'');'];
            eval(command);
        end
    end
    
    %switching time constant
    counter = 1;
    command=['t_0=sym(''y(',num2str(counter),')'');'];
    eval(command);
    
    %linear switching time parameter
    for i=1:obj.dim
        command=['a_s(',num2str(i),',1)=sym(''a_s(',num2str(i),')'');'];
        eval(command);
    end

    %quadratic switching time parameter
    for i=1:obj.dim
        for j=i:obj.dim
            command=['B_s(',num2str(i),'CO',num2str(j),',1)=sym(''B_s(',num2str(i),num2str(j),')'');'];
            eval(command);
            %consider symmetric entries
            command=['B_s(',num2str(j),'CO',num2str(i),',1)=sym(''B_s(',num2str(i),num2str(j),')'');'];
            eval(command);
        end
    end    
    
    %cubic switching time parameter
    for i=1:obj.dim
        for j=i:obj.dim
            for k=j:obj.dim
                command=['C_s(',num2str(i),'CO',num2str(j),'CO',num2str(k),',1)=sym(''C_s(',num2str(i),num2str(j),num2str(k),')'');'];
                eval(command);
                %consider symmetric entries
                command=['C_s(',num2str(i),'CO',num2str(k),'CO',num2str(j),',1)=sym(''C_s(',num2str(i),num2str(j),num2str(k),')'');'];
                eval(command);
                %consider symmetric entries
                command=['C_s(',num2str(j),'CO',num2str(i),'CO',num2str(k),',1)=sym(''C_s(',num2str(i),num2str(j),num2str(k),')'');'];
                eval(command);
                %consider symmetric entries
                command=['C_s(',num2str(j),'CO',num2str(k),'CO',num2str(i),',1)=sym(''C_s(',num2str(i),num2str(j),num2str(k),')'');'];
                eval(command);
                %consider symmetric entries
                command=['C_s(',num2str(k),'CO',num2str(j),'CO',num2str(i),',1)=sym(''C_s(',num2str(i),num2str(j),num2str(k),')'');'];
                eval(command);
                %consider symmetric entries
                command=['C_s(',num2str(k),'CO',num2str(i),'CO',num2str(j),',1)=sym(''C_s(',num2str(i),num2str(j),num2str(k),')'');'];
                eval(command);
            end
        end
    end
    
      
end


%------------- END OF CODE --------------