/* ============================================================
   AUTOMOBILE FAULT DIAGNOSIS EXPERT SYSTEM
   Production Rules + Forward and Backward Reasoning
   Compatible with SWI-Prolog
   ============================================================ */

/* ------------------------------------------------------------
   1. KNOWLEDGE BASE
   ------------------------------------------------------------

   Symptoms:
      engine_noise
      starting_problem
      warning_indicator
      abnormal_vibration
      reduced_mileage

   Possible faults:
      weak_battery
      faulty_spark_plugs
      clogged_fuel_filter
      alternator_failure
      engine_oil_problem
      worn_engine_bearing
      wheel_alignment_problem
      tire_imbalance
      brake_problem
      faulty_fuel_injector
      oxygen_sensor_fault
      catalytic_converter_problem
      engine_overheating
      ignition_system_fault
*/


/* ============================================================
   2. PRODUCTION RULES
   IF symptoms THEN probable fault
   ============================================================ */

/* Starting problems */

rule(weak_battery,
     [starting_problem, dim_headlights]).

rule(faulty_spark_plugs,
     [starting_problem, engine_misfire]).

rule(clogged_fuel_filter,
     [starting_problem, reduced_mileage]).

rule(alternator_failure,
     [starting_problem, warning_indicator, dim_headlights]).

/* Engine noise */

rule(engine_oil_problem,
     [engine_noise, low_oil_level]).

rule(worn_engine_bearing,
     [engine_noise, abnormal_vibration]).

rule(engine_overheating,
     [engine_noise, high_temperature, warning_indicator]).

/* Abnormal vibration */

rule(wheel_alignment_problem,
     [abnormal_vibration, vehicle_pulls_sideways]).

rule(tire_imbalance,
     [abnormal_vibration, steering_wheel_shaking]).

rule(brake_problem,
     [abnormal_vibration, vibration_during_braking]).

/* Reduced mileage */

rule(faulty_fuel_injector,
     [reduced_mileage, engine_misfire]).

rule(oxygen_sensor_fault,
     [reduced_mileage, warning_indicator]).

rule(catalytic_converter_problem,
     [reduced_mileage, warning_indicator, poor_acceleration]).

/* General rules */

rule(ignition_system_fault,
     [starting_problem, engine_misfire, warning_indicator]).


/* ============================================================
   3. FAULT DESCRIPTIONS
   ============================================================ */

fault_description(weak_battery,
    'Battery may be weak or discharged.').

fault_description(faulty_spark_plugs,
    'Spark plugs may be worn, dirty, or faulty.').

fault_description(clogged_fuel_filter,
    'Fuel filter may be clogged and restricting fuel flow.').

fault_description(alternator_failure,
    'Alternator may not be charging the battery correctly.').

fault_description(engine_oil_problem,
    'Engine oil level may be low or oil quality may be poor.').

fault_description(worn_engine_bearing,
    'Engine bearing may be worn or damaged.').

fault_description(wheel_alignment_problem,
    'Wheels may require alignment.').

fault_description(tire_imbalance,
    'One or more tires may be improperly balanced.').

fault_description(brake_problem,
    'Brake components may be worn or damaged.').

fault_description(faulty_fuel_injector,
    'Fuel injector may be clogged or malfunctioning.').

fault_description(oxygen_sensor_fault,
    'Oxygen sensor may be faulty.').

fault_description(catalytic_converter_problem,
    'Catalytic converter may be clogged or malfunctioning.').

fault_description(engine_overheating,
    'Engine temperature is too high; cooling system should be checked.').

fault_description(ignition_system_fault,
    'Ignition system may have a fault.').


/* ============================================================
   4. FORWARD CHAINING
   ============================================================

   Forward reasoning starts with known symptoms and repeatedly
   applies rules until a fault is derived.
   ============================================================ */

forward_diagnosis(Symptoms, Faults) :-
    forward_chain(Symptoms, Symptoms, Faults).

forward_chain(Known, Initial, Faults) :-
    findall(Fault,
            (
                rule(Fault, Conditions),
                subset_list(Conditions, Known),
                \+ member(Fault, Known)
            ),
            NewFaults),

    NewFaults \= !,

    append(Known, NewFaults, UpdatedKnown),

    ( NewFaults = []
    ->
        find_faults(UpdatedKnown, Faults)
    ;
        forward_chain(UpdatedKnown, Initial, Faults)
    ).

/* Extract only known faults from the knowledge list */

find_faults(Known, Faults) :-
    findall(Fault,
            (
                fault_description(Fault, _),
                member(Fault, Known)
            ),
            Faults).


/* ============================================================
   5. BACKWARD CHAINING
   ============================================================

   Backward reasoning starts with a possible fault and asks:
   "What symptoms are required to prove this fault?"
   ============================================================ */

backward_diagnosis(Symptoms, Fault) :-
    fault_description(Fault, _),
    prove_fault(Fault, Symptoms).


prove_fault(Fault, Symptoms) :-
    rule(Fault, Conditions),
    all_conditions_true(Conditions, Symptoms).


/* Check whether every required symptom is present */

all_conditions_true([], _).

all_conditions_true([Condition|Rest], Symptoms) :-
    member(Condition, Symptoms),
    all_conditions_true(Rest, Symptoms).


/* ============================================================
   6. UTILITY PREDICATE
   ============================================================ */

subset_list([], _).

subset_list([H|T], List) :-
    member(H, List),
    subset_list(T, List).


/* ============================================================
   7. INTERACTIVE DIAGNOSIS
   ============================================================ */

diagnose :-
    write('=============================================='), nl,
    write('     AUTOMOBILE FAULT DIAGNOSIS SYSTEM'), nl,
    write('=============================================='), nl,
    nl,

    write('Enter symptoms as a Prolog list.'), nl,
    write('Example:'), nl,
    write('[starting_problem, engine_misfire, warning_indicator].'),
    nl, nl,

    write('Symptoms: '),
    read(Symptoms),

    nl,
    write('Running forward chaining...'), nl,

    forward_diagnosis(Symptoms, Faults),

    display_results(Faults).


/* ============================================================
   8. DISPLAY RESULTS
   ============================================================ */

display_results([]) :-
    nl,
    write('No probable fault could be determined.'), nl.

display_results(Faults) :-
    Faults \= [],
    nl,
    write('----------------------------------------------'), nl,
    write('PROBABLE FAULT(S)'), nl,
    write('----------------------------------------------'), nl,
    display_faults(Faults).


display_faults([]).

display_faults([Fault|Rest]) :-
    fault_description(Fault, Description),
    write('* '),
    write(Fault),
    write(' : '),
    write(Description),
    nl,
    display_faults(Rest).


/* ============================================================
   9. FORWARD CHAINING WITH TRACE
   ============================================================ */

forward_trace(Symptoms) :-
    write('=============================================='), nl,
    write('          FORWARD CHAINING TRACE'), nl,
    write('=============================================='), nl,
    forward_trace_loop(Symptoms).


forward_trace_loop(Known) :-
    findall(Fault,
            (
                rule(Fault, Conditions),
                subset_list(Conditions, Known),
                \+ member(Fault, Known)
            ),
            NewFaults),

    ( NewFaults = []
    ->
        write('No more rules can be fired.'), nl,
        find_faults(Known, Faults),
        nl,
        write('Final faults: '),
        write(Faults),
        nl
    ;
        write('Rules fired: '),
        write(NewFaults),
        nl,

        append(Known, NewFaults, UpdatedKnown),

        forward_trace_loop(UpdatedKnown)
    ).


/* ============================================================
   10. BACKWARD CHAINING WITH TRACE
   ============================================================ */

backward_trace(Symptoms, Fault) :-
    write('=============================================='), nl,
    write('          BACKWARD CHAINING TRACE'), nl,
    write('=============================================='), nl,

    write('Trying to prove fault: '),
    write(Fault),
    nl,

    backward_trace_rule(Fault, Symptoms).


backward_trace_rule(Fault, Symptoms) :-
    rule(Fault, Conditions),

    write('Rule selected for '),
    write(Fault),
    write(': IF '),
    write(Conditions),
    write(' THEN '),
    write(Fault),
    nl,

    check_conditions(Conditions, Symptoms).


check_conditions([], _) :-
    write('All conditions satisfied.'), nl,
    write('Fault proven: '),
    write('yes'),
    nl.

check_conditions([Condition|Rest], Symptoms) :-
    write('Checking symptom: '),
    write(Condition),
    write(' ... '),

    ( member(Condition, Symptoms)
    ->
        write('present'),
        nl,
        check_conditions(Rest, Symptoms)
    ;
        write('NOT present'),
        nl,
        write('Fault cannot be proven.'),
        nl,
        fail
    ).


/* ============================================================
   11. SAMPLE TEST CASES
   ============================================================ */

/*
TEST CASE 1:

?- forward_diagnosis(
       [starting_problem, dim_headlights],
       Faults).

Expected:

Faults = [weak_battery].


TEST CASE 2:

?- forward_diagnosis(
       [starting_problem, engine_misfire, warning_indicator],
       Faults).

Expected:

Faults = [ignition_system_fault].


TEST CASE 3:

?- forward_diagnosis(
       [abnormal_vibration, steering_wheel_shaking],
       Faults).

Expected:

Faults = [tire_imbalance].


TEST CASE 4:

?- forward_diagnosis(
       [reduced_mileage, warning_indicator],
       Faults).

Expected:

Faults = [oxygen_sensor_fault].


TEST CASE 5:

?- forward_diagnosis(
       [engine_noise, low_oil_level],
       Faults).

Expected:

Faults = [engine_oil_problem].


BACKWARD CHAINING:

?- backward_diagnosis(
       [starting_problem, dim_headlights],
       weak_battery).

Expected:

true.


?- backward_diagnosis(
       [starting_problem],
       weak_battery).

Expected:

false.
*/


/* ============================================================
   END OF PROGRAM
   ============================================================ */
