function [] = draw_landscape(seed,func)
fname1=sprintf('figs/F%d.eps',func);
fname2=sprintf('figs/F%d.png',func);
fgoptima = [200.0 1.0 1.0 200.0 1.031628453489877 186.7309088310239 1.0 2709.093505572820 1.0 -2.0 zeros(1,10)];
switch func
    case 1
        figure;
        x=[0:0.1:30];
        y=zeros(size(x));
        for i=1:length(x)
            y(i) = niching_func(x(i),1);
        end
        plot(x,y,'b-');
        hold on;
        scatter(seed(:,1),fgoptima(func),"red","filled","o");
        hold off;
        saveas(gcf,fname1,'psc2')
        saveas(gcf,fname2,'png')
    case 2
        figure;
        x=[0:0.001:1];
        y=zeros(size(x));
        for i=1:length(x)
            y(i) = niching_func(x(i),2);
        end
        plot(x,y,'b-');
        hold on;
        scatter(seed(:,1),fgoptima(func),"red","filled","o");
        hold off;
        saveas(gcf,fname1,'psc2')
        saveas(gcf,fname2,'png')
    case 3
        figure;
        x=[0:0.001:1];
        y=zeros(size(x));
        for i=1:length(x)
        	y(i) = niching_func(x(i),3);
        end
        plot(x,y,'b-');
        hold on;
        scatter(seed(:,1),fgoptima(func),"red","filled","o");
        hold off;
        saveas(gcf,fname1,'psc2')
        saveas(gcf,fname2,'png')
    case 4
        figure;
        [X,Y] = meshgrid(-6:.05:6);
        Z=zeros(size(X));
        i=1;
        for x=-6:0.05:6
        	j=1;
        	for y=-6:0.05:6
        		Z(i,j) = niching_func([x y],4);
        		j=j+1;
        	end
        	i=i+1;
        end
        surfc(X,Y,Z, 'FaceColor','interp','FaceLighting','phong','EdgeColor','none');
        axis([-6 6 -6 6 -2000 200])
        hold on;
        result = repmat(fgoptima(func), size(seed,1), 1);
        scatter3(seed(:,2),seed(:,1),result,"red","filled","o");
        hold off;
        saveas(gcf,fname1,'psc2')
        saveas(gcf,fname2,'png')
    case 5
        figure;
        [X,Y] = meshgrid(linspace(-1.9,1.9,200),linspace(-1.1,1.1,200));
        Z=zeros(size(X));
        i=1;
        for x=linspace(-1.9,1.9,200)
        	j=1;
        	for y=linspace(-1.1,1.1,200)
        		Z(i,j) = niching_func([x y],5);
        		j=j+1;
        	end
        	i=i+1;
        end
        surfc(X,Y,Z, 'FaceColor','interp','FaceLighting','phong','EdgeColor','none');
        axis([-1.9 1.9 -1.1 1.1 -6 2])
        hold on;
        result = repmat(fgoptima(func), size(seed,1), 1);
        scatter3(seed(:,2),seed(:,1),result,"red","filled","o");
        hold off;
        saveas(gcf,fname1,'psc2')
        saveas(gcf,fname2,'png')
    case 6
        figure;
        [X,Y] = meshgrid(-10:0.1:10);
        Z=zeros(size(X));
        i=1;
        for x=-10:0.1:10
        	j=1;
        	for y=-10:0.1:10
        		Z(i,j) = niching_func([x y],6);
        		j=j+1;
        	end
        	i=i+1;
        end
        surfc(X,Y,Z, 'FaceColor','interp','FaceLighting','phong','EdgeColor','none');
        %axis([-10 10 -10 10 -300 200])
        hold on;
        result = repmat(fgoptima(func), size(seed,1), 1);
        scatter3(seed(:,2),seed(:,1),result,"red","filled","o");
        hold off;
        saveas(gcf,fname1,'psc2')
        saveas(gcf,fname2,'png')
    case 7  
        figure;
        [X,Y] = meshgrid(0.25:0.05:10);
        Z=zeros(size(X));
        i=1;
        for x=0.25:0.05:10
        	j=1;
        	for y=0.25:0.05:10
        		Z(i,j) = niching_func([x y],7);
        		j=j+1;
        	end
        	i=i+1;
        end
        surfc(X,Y,Z, 'FaceColor','interp','FaceLighting','phong','EdgeColor','none');
        %axis([0.25 10 0.25 10 -1 1])
        hold on;
        result = repmat(fgoptima(func), size(seed,1), 1);
        scatter3(seed(:,2),seed(:,1),result,"red","filled","o");
        hold off;
        saveas(gcf,fname1,'psc2')
        saveas(gcf,fname2,'png')
    case 10
        figure;
        [X,Y] = meshgrid(0:0.01:1);
        Z=zeros(size(X));
        i=1;
        for x=0:0.01:1
        	j=1;
        	for y=0:0.01:1
        		Z(i,j) = niching_func([x y],10);
        		j=j+1;
        	end
        	i=i+1;
        end
        surfc(X,Y,Z, 'FaceColor','interp','FaceLighting','phong','EdgeColor','none');
        axis([0 1 0 1 -40 10])
        hold on;
        result = repmat(fgoptima(func), size(seed,1), 1);
        scatter3(seed(:,2),seed(:,1),result,"red","filled","o");
        hold off;
        saveas(gcf,fname1,'psc2')
        saveas(gcf,fname2,'png')
    case 11
        figure;
        x=-5:0.1:5; y=x;
        global initial_flag
        initial_flag=0;
        func_num = 11;

        L = length(x);
        f = zeros(L);

        for i=1:L
        	for j=1:L
        		f(i,j) = niching_func([x(i),y(j)],func_num);
        	end
        end

        surfc(x,y,f,'FaceColor','interp','FaceLighting','phong','EdgeColor','none');
        grid off;
        hold on;
        result = repmat(fgoptima(func), size(seed,1), 1);
        scatter3(seed(:,2),seed(:,1),result,"red","filled","o");
        hold off;
        saveas(gcf,fname1,'psc2')
        saveas(gcf,fname2,'png')
    case 12
        figure;
        x=-5:0.1:5; y=x;
        global initial_flag
        initial_flag=0;
        func_num = 12;

        L = length(x);
        f = zeros(L);

        for i=1:L
        	for j=1:L
        		f(i,j) = niching_func([x(i),y(j)],func_num);
        	end
        end

        surfc(x,y,f,'FaceColor','interp','FaceLighting','phong','EdgeColor','none');
        grid off;
        hold on;
        result = repmat(fgoptima(func), size(seed,1), 1);
        scatter3(seed(:,2),seed(:,1),result,"red","filled","o");
        hold off;
        saveas(gcf,fname1,'psc2')
        saveas(gcf,fname2,'png')
    case 13
        figure;
        x=-5:0.1:5; y=x;
        global initial_flag
        initial_flag=0;
        func_num = 13;

        L = length(x);
        f = zeros(L);

        for i=1:L
        	for j=1:L
        		f(i,j) = niching_func([x(i),y(j)],func_num);
        	end
        end

        surfc(x,y,f,'FaceColor','interp','FaceLighting','phong','EdgeColor','none');
        grid off;
        hold on;
        result = repmat(fgoptima(func), size(seed,1), 1);
        scatter3(seed(:,2),seed(:,1),result,"red","filled","o");
        hold off;
        saveas(gcf,fname1,'psc2')
        saveas(gcf,fname2,'png')
    case 14
        figure;
        x=-5:0.1:5; y=x;
        global initial_flag
        initial_flag=0;
        func_num = 14;

        L = length(x);
        f = zeros(L);

        for i=1:L
        	for j=1:L
        		f(i,j) = niching_func([x(i),y(j)],func_num);
        	end
        end

        surfc(x,y,f,'FaceColor','interp','FaceLighting','phong','EdgeColor','none');
        grid off;
        hold on;
        result = repmat(fgoptima(func), size(seed,1), 1);
        scatter3(seed(:,2),seed(:,1),result,"red","filled","o");
        hold off;
        saveas(gcf,fname1,'psc2')
        saveas(gcf,fname2,'png')
end

