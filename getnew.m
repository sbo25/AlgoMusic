function new = getnew(old)
    pick = [];
    x=floor(rand*4)+1;
    if x == 1
       for i = (old(1)-1):(old(2)-2)
           pick = [pick,i];
       end
    end
    if x == 2 || x == 3
        for i = (old(x-1)+1):(old(x+1)-2)
           pick = [pick,i];
        end
    end
    if x == 4
        for i = (old(3)+2):(old(4)+1)
            pick = [pick,i];
        end
    end
    if isempty(pick)
        return
    end
    y = old(x);
    while y==old(x)
    y = pick(floor(rand*length(pick))+1);
    end
    old(x)=y;
    new=old;
end
            