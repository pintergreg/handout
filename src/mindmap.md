# MindMap

Összefoglaláshoz, gyors áttekintéshez használható, az előadásanyagot többé-kevésbé lefedő *mindmap*. Egérgörgővel nagyítható/távolítható és canvas-on belül szabadon mozgatható.

<svg id="markmap-target" style="width: 100%; height: 75vh;"></svg>
<div id="markmap-source" hidden>

    # SzFMV


    ## Agile

    - SCRUM
        - Roles
            - Scrum Master
                - Developer Representative
                - Impediment handler
                - Facilitator
                - Ensures calm and uninterrupted working
            - Product Owner
                - Customer Representative
                - Creates PB
                - Prioritizese PB
            - Developer
            - Team
                - Self-organizing
                - Cross-functional
        - Epic
            - User Story
                - Task
        - Events
            - Sprint Planning
            - Daily Standup
                - 3 questions
                - TimeBox
                - Always on the same time and at the same place
                - Standing up
            - Backlog Grooming
                - Refinement of User Story DoD
                    - SMART goals
                - Effort estimation
            - Retrospective
            - Demo
            - Sprint Review
        - Artifacts
            - Sprint Backlog
            - Product Backlog
            - Sprint Goal
            - Definition of Done
            - Burndown Chart
            - Board
    - Kanban
        - Continuous (not iterative)
        - No roles, no events
        - Board necessary - pick top right task
    - Culture / Mindset
        - Agile Manifesto
            - Agile Principles
        - Iterative
        - Change handling
    - Waterfall / V-Model
    - Business Value

    ## Clean Code

    - Communication
        - understanding what it does
    - Style Guideline
        - Naming
            - Variables
                - Why?
        - Function
            - Short functions
            - Does one thing
        - Scope
            - Functions - one scope
            - Variables - Scope
    - Self Documenting - No comments
    - Code Smells
        - Long function
        - Too many parameters
        - God Class
        - Boolean parameter
        - Magic number
        - Circular dependency
        - Too complex (cyclomatic complexity)
    - Refactoring
        - Boy scout mantra

    ## Review

    - What?
        - Requirement
        - Architecture
        - Design
        - Work events
        - Code
        - Everything
        - Work product - not the developer
    - Why?
        - Avoid errors
    - Who?
        - Anyone who's competent in the topic
    - Levels
        - Formal
            - Traceable
            - Documented
            - Rule Based
            - Type
                - Walkthrough
                - Inspection
                - Technical
            - Dedicated roles
                - Minute taker
                - Expert
                - Moderator
        - Informal
            - Over the shoulder
            - Pair Programming
    - Finding
        - Severe / Major
            - must be changed
        - Suggestion / Minor
            - may be changed
        - Question
            - WTF?
        - Action
            - Ignore
            - Fix
            - Answer
            - Explain
            - Promote
    - Debug Ducky

    ## Legacy Code

    - SOLID
        - Design Principles
            - **S**ingle Responsibility
            - **O**pen-closed
            - **L**iskov's Substitution
            - **I**nterface Segregation
            - **D**ependency Inversion
    - Code without tests
        - Gets better or worse?
    - Sprout
        - method
        - class
    - Avoid, rewrite
    - Legacy Code Dilemma
        - Can't change the code without adding tests
        - Have to change the code to add tests
    - Seams
        - Change the behaviour without changing the code
        - Object Seam
        - Linker Seam
        - Preprocessor
    - Reason of change
        - Performance
            - Optimization
        - Functionality
            - Bugfix
            - New Feature
        - Structure
            - Refactoring
    - Overestimation
        - Get the oppurtunity to reverse legacy

    ## Test Driven Development

    - Software Unit
        - Function
        - Class
        - Module
    - Test Suite
        - Test Case
            - Test
                - Single Assert
                - Logical, not semantical
        - Fast as hell
            - ms fast
            - Effectiveness
            - Flow
    - AAA(A) Rule
        - Arrange
            - Set up system under test
            - Dependencies
            - Mocking
                - Database
                - Hardware
                - Mock object
                    - Dummy
                    - Stub
                    - Fake
                    - Mock
                    - Spy
        - Act
            - Do the needful
        - Assert
            - Expected vs. Actual
            - Single Assert
        - (Annihilate)
            - Free resource
    - Red -> Green -> Refactor
        - Write a failing test
        - Make the test pass
            - Code Golf
            - As little code as possible
        - Refactor
    - Fastest feedback
    - Safety net
    - Getting stuck
        - Transformation Priorities
    - Done
        - Potato mantra

    ## Continuous Integration

    - Interrupt
        - Loosing hours of work
    - Workload reduction
    - Work automation
    - Structure
        - Version Tracking
            - Best Practices
                - Syncronize often
                - Small changes
                - Merge often
                - Independent tasks
        - Continuous Integration Server
            - Automatic Build
                - Jobs / Pipelines
            - Automatic Integration
            - Automatic Test
            - Automatic Release
            - Automatic Deploy
        - Feedback to stakeholders
    - Trigger
        - Nightly Build
            - time based
        - Trigger
            - Push
            - Pull Request
        - Manual
    - DevOps
        - Developers
        - Operations
    - Integration Strategy
        - Bottom-Up
        - Top-Down
        - Big-Bang
        - Ricky-Hardest
    - Levels
        - Unit
        - Integration
        - Feature
        - System
        - Acceptance
        - Manual

    ## Architecture


</div>
