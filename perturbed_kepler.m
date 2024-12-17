%perturbed kepler

function dYdt = pkepler(t, Y)
    q1 = Y(1); %q x component
    q2 = Y(2); %q y component
    p1 = Y(3); %p x component
    p2 = Y(4); %p y component

    eps = 0.1;

    dYdt = zeros(4, 1);
    dYdt(1) = p1;
    dYdt(2) = p2;
    dYdt(3) = -q1/(((q1^2)+(q2^2))^(3/2))+eps*q1/((q1^2)+(q2^2));
    dYdt(4) = -q2/(((q1^2)+(q2^2))^(3/2))+eps*q2/((q1^2)+(q2^2));

end %defines the kepler function with x and y components for p and q

%initial conditions
q1_0 = 1;
q2_0 = 0;
p1_0 = 0;
p2_0 = 1;

Y0 = [q1_0; q2_0; p1_0; p2_0];

%time span
tspan = [0 200];

%error tolerance
options = odeset(RelTol=1e-8,AbsTol=1e-8);

%solve
[t, Y] = ode45(@pkepler, tspan, Y0, options);

%q1, q2, p1, p2 over time
figure;%aspect ratio
subplot(4, 1, 1);
plot(t, Y(:,1), 'r-', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('X Position (q1)');
title('X Position (q1) vs. Time');
grid on;

subplot(4, 1, 2);
plot(t, Y(:,2), 'g-', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Y Position (q2)');
title('Y Position (q2) vs. Time');
grid on;

subplot(4, 1, 3);
plot(t, Y(:,3), 'b-', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('X Momentum (p1)');
title('X Momentum (p1) vs. Time');
grid on;

subplot(4, 1, 4);
plot(t, Y(:,4), 'm-', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Y Momentum (p2)');
title('Y Momentum (p2) vs. Time');
grid on;

%trajectory q1 vs q2
figure;
plot(Y(:,1), Y(:,2), 'k-', 'LineWidth', 1.5);
xlabel('X Position (q1)');
ylabel('Y Postion (q2)');
title('Planet Trajectory (q1 vs. q2)');

%x and y plots of q vs p
figure;
subplot(2, 1, 1);
plot(Y(:,1), Y(:,3), 'k-', 'LineWidth', 1.5);
xlabel('X Position (q1)');
ylabel('X Momentum (p1)');
title('X components (q1 vs. p1)');

subplot(2, 1, 2);
plot(Y(:,1), Y(:,2), 'k-', 'LineWidth', 1.5);
xlabel('Y Position (q2)');
ylabel('Y Momentum (p2)');
title('Y components (q2 vs. p2)');