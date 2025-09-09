%
% Demo is a visualization of the bisection method to find a root of some
% function using Octave (Matlab-like tool).
%
% Easy steps to run this demo with f(x) = x^3 - 2x - 1
%
% x_range = -2:0.1:4;                 % Set the x-range to be [-2, 4]
% f = @(x) x .^ 3 - 2*x - 1           % Set function to x^3 - 2x - 1
% bisection_viz(f, -2, 4, 0.001);     % Call this function on [-2, 4]
%
% Demo pauses for a keypress in the Command Window after each iteration.
%
% This demo was derived from multiple Internet sources
%

function bisection_viz(f, a, b, tol)
    % BISECTION_VIZ Visualizes the bisection method in Octave.
    % INPUTS
        % f: The function handle (e.g., @(x) x^3 - x - 2).
        % a: The initial lower bound of the search interval.
        % b: The initial upper bound of the search interval.
        % tol: The tolerance for the root approximation.
    % OUTPUTS
        % Animated plot is created.

    % Error checking for a valid bracketing interval
    if f(a) * f(b) >= 0
        error('Function does not have opposite signs at interval endpoints.');
    end

    % Define plotting parameters
    x_plot = linspace(a, b, 100);
    y_plot = f(x_plot);

    % Set up the plot
    figure;
    plot(x_plot, y_plot, 'b-', 'linewidth', 2); % Plot the function curve
    hold on;
    plot([a, b], [0, 0], 'k--'); % Plot the x-axis
    xlabel('x');
    ylabel('f(x)');
    title('Bisection Method Visualization');
    grid on;

    % Initialize iteration counter
    iteration = 0;

    % Loop until tolerance is met
    while (b - a) / 2 > tol

        iteration = iteration + 1;

        % Calculate midpoint
        c = (a + b) / 2;

        % Plot current iteration
        plot(a, f(a), 'ro', 'markersize', 8, 'markerfacecolor', 'r');
        plot(b, f(b), 'ro', 'markersize', 8, 'markerfacecolor', 'r');
        plot(c, f(c), 'go', 'markersize', 8, 'markerfacecolor', 'g');
        line([c, c], [0, f(c)], 'color', 'g', 'linestyle', '--');
        line([a, b], [f(a), f(b)], 'color', 'r', 'linestyle', ':');

        % Display info for the current iteration
        fprintf('Iteration %d: Interval [%f, %f], Midpoint c = %f\n', iteration, a, b, c);

        % Update the interval
        if f(a) * f(c) < 0
            b = c;
        else
            a = c;
        end

        % Add a brief pause to visualize the steps. Press any key to continue.
        pause();
    end

    % Final plot of the estimated root
    c = (a + b) / 2;
    plot(c, f(c), 'g*', 'markersize', 15, 'markerfacecolor', 'g');
    fprintf('\nFound root approximation at x = %f after %d iterations.\n', c, iteration);
    hold off;
end
