-- COMP353 Main Project - Summer 2025  
-- Database Application System for Montréal Volleyball Club (MVC)
-- Data population script for additional tables including Teams, TeamFormations,
-- TeamPlayers, EmailLogs, and SecondaryFamilyMembers
-- This extends the warm-up project with comprehensive test data for:
-- - Team management across multiple locations
-- - Game and training session formations 
-- - Player assignments with proper role distributions
-- - Email logging for automated weekly notifications
-- - Secondary family member relationships
-- Clear existing data to prevent conflicts and ensure fresh data
DELETE FROM SecondaryFamilyMembers;
DELETE FROM EmailLogs;
DELETE FROM TeamPlayers;
DELETE FROM TeamFormations;
DELETE FROM Teams;
-- Insert data into Teams table
INSERT INTO Teams (teamName, headCoachID, locationID, gender) VALUES 
('Pallet Town Pikachus', 1, 1, 'Male'), ('Cerulean City Staryu', 2, 2, 'Female'), ('Vermilion Voltorbs', 3, 3, 'Male'),
('Celadon Grass Giants', 9, 4, 'Female'), ('Fuchsia Poison Spikes', 5, 5, 'Male'), ('Saffron Psychic Powers', 8, 6, 'Female'),
('Lavender Ghost Hunters', 6, 7, 'Male'), ('Goldenrod Golden Eagles', 10, 8, 'Female'), ('Ecruteak Ancient Spirits', 2, 9, 'Male'),
('Blackthorn Dragon Force', 3, 10, 'Female'), ('Pallet Town Thunder', 4, 1, 'Female'), ('Cerulean Waves', 1, 2, 'Male'),
('Vermilion Storm', 9, 3, 'Female'), ('Celadon Rangers', 8, 4, 'Male'), ('Fuchsia Lightning', 10, 5, 'Female');
-- Insert data into TeamFormations table
INSERT INTO TeamFormations (locationID, sessionType, sessionDate, sessionTime, sessionAddress, teamID, team2ID, scoreTeam1, scoreTeam2) VALUES 
(1, 'Game', '2024-03-15', '18:00:00', '1 Oak St, Pallet Town', 1, 3, 25, 22),
(2, 'Training', '2024-03-20', '17:30:00', '25 Water Rd, Cerulean City', 2, 4, NULL, NULL),
(3, 'Game', '2024-04-10', '19:00:00', '10 Harbor St, Vermilion City', 3, 5, 21, 25),
(4, 'Training', '2024-04-15', '16:00:00', '5 Green Ave, Celadon City', 4, 6, NULL, NULL),
(5, 'Game', '2024-05-05', '18:30:00', '15 Pink Blvd, Fuchsia City', 5, 7, 25, 18),
(6, 'Training', '2024-05-12', '17:00:00', '30 Electric Rd, Saffron City', 6, 8, NULL, NULL),
(7, 'Game', '2024-06-01', '19:30:00', '2 Spirit Ln, Lavender Town', 7, 9, 22, 25),
(8, 'Training', '2024-06-08', '16:30:00', '88 Radio St, Goldenrod City', 8, 10, NULL, NULL),
(9, 'Game', '2024-07-15', '18:00:00', '3 Bell Rd, Ecruteak City', 9, 1, 25, 20),
(10, 'Training', '2024-07-22', '17:30:00', '10 Dragon St, Blackthorn City', 10, 2, NULL, NULL),
(1, 'Game', '2024-08-05', '18:30:00', '1 Oak St, Pallet Town', 1, 5, 25, 23),
(2, 'Game', '2024-08-12', '19:00:00', '25 Water Rd, Cerulean City', 2, 6, 22, 25),
(3, 'Training', '2024-08-20', '17:00:00', '10 Harbor St, Vermilion City', 11, 12, NULL, NULL),
(4, 'Game', '2024-09-01', '18:30:00', '5 Green Ave, Celadon City', 13, 14, 25, 21),
(5, 'Training', '2024-09-08', '16:30:00', '15 Pink Blvd, Fuchsia City', 15, 1, NULL, NULL),
(6, 'Game', '2024-09-15', '19:00:00', '30 Electric Rd, Saffron City', 11, 13, 24, 26),
(7, 'Training', '2024-09-22', '17:30:00', '2 Spirit Ln, Lavender Town', 12, 14, NULL, NULL),
(8, 'Game', '2024-09-29', '18:00:00', '88 Radio St, Goldenrod City', 15, 2, 25, 19),
(9, 'Training', '2024-10-05', '16:00:00', '3 Bell Rd, Ecruteak City', 11, 15, NULL, NULL),
(10, 'Game', '2024-10-12', '19:30:00', '10 Dragon St, Blackthorn City', 12, 13, 23, 25),
-- Additional 2025 formations for Query #10 and #12 to have sufficient data
(1, 'Game', '2025-01-15', '18:00:00', '1 Oak St, Pallet Town', 1, 2, 25, 22),
(1, 'Training', '2025-02-10', '17:30:00', '1 Oak St, Pallet Town', 3, 4, NULL, NULL),
(1, 'Game', '2025-02-25', '19:00:00', '1 Oak St, Pallet Town', 5, 6, 24, 21),
(1, 'Game', '2025-03-10', '18:30:00', '1 Oak St, Pallet Town', 7, 8, 23, 25),
(1, 'Training', '2025-03-20', '17:00:00', '1 Oak St, Pallet Town', 9, 10, NULL, NULL),
(1, 'Game', '2025-04-05', '19:00:00', '1 Oak St, Pallet Town', 11, 12, 25, 20),
(1, 'Game', '2025-04-20', '18:00:00', '1 Oak St, Pallet Town', 13, 14, 22, 25),
(1, 'Training', '2025-05-05', '17:30:00', '1 Oak St, Pallet Town', 15, 1, NULL, NULL),
(1, 'Game', '2025-05-25', '19:00:00', '1 Oak St, Pallet Town', 2, 3, 25, 23),
-- Additional formations at other locations for Query #12
(2, 'Game', '2025-01-20', '18:00:00', '25 Water Rd, Cerulean City', 4, 5, 25, 22),
(2, 'Game', '2025-02-15', '19:00:00', '25 Water Rd, Cerulean City', 6, 7, 21, 25),
(2, 'Game', '2025-03-15', '18:30:00', '25 Water Rd, Cerulean City', 8, 9, 25, 24),
(2, 'Game', '2025-04-10', '19:00:00', '25 Water Rd, Cerulean City', 10, 11, 23, 25),
(2, 'Game', '2025-05-10', '18:00:00', '25 Water Rd, Cerulean City', 12, 13, 25, 21),
(3, 'Game', '2025-01-25', '18:00:00', '10 Harbor St, Vermilion City', 14, 15, 22, 25),
(3, 'Game', '2025-02-20', '19:00:00', '10 Harbor St, Vermilion City', 1, 4, 25, 23),
(3, 'Game', '2025-03-25', '18:30:00', '10 Harbor St, Vermilion City', 7, 10, 24, 25),
(3, 'Game', '2025-04-15', '19:00:00', '10 Harbor St, Vermilion City', 13, 2, 25, 22),
(3, 'Game', '2025-05-15', '18:00:00', '10 Harbor St, Vermilion City', 5, 8, 21, 25),
-- Additional 2025 game sessions for locations 4-12 to ensure Query #12 returns at least 5 locations
-- Celadon Club (Location 4) - Adding 4 game sessions
(4, 'Game', '2025-01-12', '18:00:00', '5 Green Ave, Celadon City', 4, 1, 22, 25),
(4, 'Game', '2025-02-18', '19:00:00', '5 Green Ave, Celadon City', 14, 2, 25, 20),
(4, 'Game', '2025-03-22', '18:30:00', '5 Green Ave, Celadon City', 4, 3, 24, 21),
(4, 'Game', '2025-04-26', '19:30:00', '5 Green Ave, Celadon City', 14, 5, 23, 25),
-- Fuchsia Club (Location 5) - Adding 4 game sessions
(5, 'Game', '2025-01-18', '18:00:00', '15 Pink Blvd, Fuchsia City', 5, 6, 25, 19),
(5, 'Game', '2025-02-22', '19:00:00', '15 Pink Blvd, Fuchsia City', 15, 7, 21, 25),
(5, 'Game', '2025-03-28', '18:30:00', '15 Pink Blvd, Fuchsia City', 5, 8, 25, 22),
(5, 'Game', '2025-05-02', '19:30:00', '15 Pink Blvd, Fuchsia City', 15, 9, 20, 25),
-- Saffron Club (Location 6) - Adding 4 game sessions
(6, 'Game', '2025-01-25', '18:00:00', '30 Electric Rd, Saffron City', 6, 10, 25, 18),
(6, 'Game', '2025-02-28', '19:00:00', '30 Electric Rd, Saffron City', 6, 1, 22, 25),
(6, 'Game', '2025-04-04', '18:30:00', '30 Electric Rd, Saffron City', 6, 2, 25, 21),
(6, 'Game', '2025-05-08', '19:30:00', '30 Electric Rd, Saffron City', 6, 3, 24, 25),
-- Lavender Club (Location 7) - Adding 4 game sessions
(7, 'Game', '2025-02-02', '18:00:00', '2 Spirit Ln, Lavender Town', 7, 4, 25, 17),
(7, 'Game', '2025-03-06', '19:00:00', '2 Spirit Ln, Lavender Town', 7, 5, 20, 25),
(7, 'Game', '2025-04-12', '18:30:00', '2 Spirit Ln, Lavender Town', 7, 6, 25, 19),
(7, 'Game', '2025-05-16', '19:30:00', '2 Spirit Ln, Lavender Town', 7, 8, 23, 25);
-- Insert data into TeamPlayers table
-- Note: Formation IDs will be auto-generated starting from 1 based on insertion order
INSERT INTO TeamPlayers (formationID, clubMemberID, role) VALUES 
-- Formation 1: Pallet Town vs Vermilion (2024-03-15)
(1, 1, 'Setter'), (1, 2, 'Outside Hitter'), (1, 4, 'Middle Blocker'), (1, 6, 'Opposite Hitter'), (1, 8, 'Defensive Specialist'), (1, 10, 'Libero'),
-- Formation 2: Cerulean Training (2024-03-20)
(2, 2, 'Setter'), (2, 4, 'Outside Hitter'), (2, 6, 'Middle Blocker'), (2, 8, 'Opposite Hitter'), (2, 10, 'Defensive Specialist'),
-- Formation 3: Vermilion vs Fuchsia (2024-04-10)
(3, 3, 'Setter'), (3, 5, 'Outside Hitter'), (3, 7, 'Middle Blocker'), (3, 9, 'Opposite Hitter'), (3, 1, 'Defensive Specialist'),
-- Formation 4: Celadon Training (2024-04-15)
(4, 4, 'Setter'), (4, 6, 'Outside Hitter'), (4, 8, 'Middle Blocker'), (4, 10, 'Opposite Hitter'),
-- Formation 5: Fuchsia vs Lavender (2024-05-05)
(5, 5, 'Setter'), (5, 7, 'Outside Hitter'), (5, 9, 'Middle Blocker'), (5, 1, 'Opposite Hitter'), (5, 3, 'Defensive Specialist'),
-- Formation 6: Saffron Training (2024-05-12)
(6, 6, 'Setter'), (6, 8, 'Outside Hitter'), (6, 10, 'Middle Blocker'), (6, 2, 'Opposite Hitter'),
-- Formation 7: Lavender vs Ecruteak (2024-06-01)
(7, 7, 'Setter'), (7, 9, 'Outside Hitter'), (7, 1, 'Middle Blocker'), (7, 3, 'Opposite Hitter'), (7, 5, 'Defensive Specialist'),
-- Formation 8: Goldenrod Training (2024-06-08)
(8, 8, 'Setter'), (8, 10, 'Outside Hitter'), (8, 2, 'Middle Blocker'), (8, 4, 'Opposite Hitter'),
-- Formation 9: Ecruteak vs Pallet Town (2024-07-15)
(9, 9, 'Setter'), (9, 1, 'Outside Hitter'), (9, 3, 'Middle Blocker'), (9, 5, 'Opposite Hitter'), (9, 7, 'Defensive Specialist'),
-- Formation 10: Blackthorn Training (2024-07-22)
(10, 10, 'Setter'), (10, 2, 'Outside Hitter'), (10, 4, 'Middle Blocker'), (10, 6, 'Opposite Hitter'),
-- Formation 11: Pallet Town vs Fuchsia (2024-08-05)
(11, 1, 'Setter'), (11, 3, 'Outside Hitter'), (11, 5, 'Middle Blocker'), (11, 7, 'Opposite Hitter'), (11, 9, 'Defensive Specialist'),
-- Formation 12: Cerulean vs Saffron (2024-08-12)
(12, 2, 'Setter'), (12, 4, 'Outside Hitter'), (12, 6, 'Middle Blocker'), (12, 8, 'Opposite Hitter'), (12, 10, 'Libero'),
-- Formation 13: Vermilion Training (2024-08-20)
(13, 3, 'Libero'), (13, 5, 'Setter'), (13, 7, 'Outside Hitter'), (13, 9, 'Middle Blocker'),
-- Formation 14: Celadon Game (2024-09-01)
(14, 2, 'Middle Blocker'), (14, 4, 'Defensive Specialist'), (14, 6, 'Setter'), (14, 8, 'Libero'),
-- Formation 15: Fuchsia Training (2024-09-08)
(15, 9, 'Outside Hitter'), (15, 10, 'Opposite Hitter'), (15, 3, 'Middle Blocker'), (15, 4, 'Defensive Specialist'),
-- Formation 16: Saffron Game (2024-09-15)
(16, 5, 'Libero'), (16, 6, 'Setter'), (16, 7, 'Middle Blocker'), (16, 8, 'Outside Hitter'),
-- Formation 17: Lavender Training (2024-09-22)
(17, 9, 'Opposite Hitter'), (17, 10, 'Setter'), (17, 1, 'Libero'), (17, 2, 'Defensive Specialist'),
-- Formation 18: Goldenrod Game (2024-09-29)
(18, 3, 'Outside Hitter'), (18, 4, 'Opposite Hitter'), (18, 5, 'Middle Blocker'), (18, 6, 'Libero'),
-- Formation 19: Ecruteak Training (2024-10-05)
(19, 7, 'Setter'), (19, 8, 'Defensive Specialist'), (19, 9, 'Outside Hitter'), (19, 10, 'Middle Blocker'),
-- Formation 20: Blackthorn Game (2024-10-12)
(20, 1, 'Setter'), (20, 2, 'Outside Hitter'), (20, 3, 'Opposite Hitter'), (20, 4, 'Libero'),
-- Additional formations for 2025 sessions (formations 21-40)
-- Formation 21: Pallet Town Game (2025-01-15)
(21, 1, 'Setter'), (21, 2, 'Outside Hitter'), (21, 3, 'Middle Blocker'), (21, 4, 'Opposite Hitter'), (21, 5, 'Libero'),
-- Formation 22: Pallet Town Training (2025-02-10)
(22, 6, 'Setter'), (22, 7, 'Outside Hitter'), (22, 8, 'Middle Blocker'), (22, 9, 'Defensive Specialist'),
-- Formation 23: Pallet Town Game (2025-02-25)
(23, 10, 'Setter'), (23, 1, 'Outside Hitter'), (23, 3, 'Middle Blocker'), (23, 5, 'Opposite Hitter'), (23, 7, 'Libero'),
-- Formation 24: Pallet Town Game (2025-03-10)
(24, 2, 'Setter'), (24, 4, 'Outside Hitter'), (24, 6, 'Middle Blocker'), (24, 8, 'Opposite Hitter'), (24, 10, 'Defensive Specialist'),
-- Formation 25: Pallet Town Training (2025-03-20)
(25, 9, 'Setter'), (25, 1, 'Outside Hitter'), (25, 2, 'Middle Blocker'), (25, 3, 'Libero'),
-- Formation 26: Pallet Town Game (2025-04-05)
(26, 4, 'Setter'), (26, 5, 'Outside Hitter'), (26, 6, 'Middle Blocker'), (26, 7, 'Opposite Hitter'), (26, 8, 'Libero'),
-- Formation 27: Pallet Town Game (2025-04-20)
(27, 9, 'Setter'), (27, 10, 'Outside Hitter'), (27, 1, 'Middle Blocker'), (27, 2, 'Defensive Specialist'),
-- Formation 28: Pallet Town Training (2025-05-05)
(28, 3, 'Setter'), (28, 4, 'Outside Hitter'), (28, 5, 'Middle Blocker'), (28, 6, 'Libero'),
-- Formation 29: Pallet Town Game (2025-05-25)
(29, 7, 'Setter'), (29, 8, 'Outside Hitter'), (29, 9, 'Middle Blocker'), (29, 10, 'Opposite Hitter'), (29, 1, 'Libero'),
-- Formation 30-55: Cerulean, Vermilion, Celadon, Fuchsia, Saffron, Lavender Games (2025)
(30, 2, 'Setter'), (30, 3, 'Outside Hitter'), (30, 4, 'Middle Blocker'), (30, 5, 'Libero'),
(31, 6, 'Setter'), (31, 7, 'Outside Hitter'), (31, 8, 'Middle Blocker'), (31, 9, 'Opposite Hitter'),
(32, 10, 'Setter'), (32, 1, 'Outside Hitter'), (32, 2, 'Middle Blocker'), (32, 3, 'Libero'),
(33, 4, 'Setter'), (33, 5, 'Outside Hitter'), (33, 6, 'Middle Blocker'), (33, 7, 'Defensive Specialist'),
(34, 8, 'Setter'), (34, 9, 'Outside Hitter'), (34, 10, 'Middle Blocker'), (34, 1, 'Libero'),
(35, 2, 'Setter'), (35, 3, 'Outside Hitter'), (35, 4, 'Middle Blocker'), (35, 5, 'Opposite Hitter'),
(36, 6, 'Setter'), (36, 7, 'Outside Hitter'), (36, 8, 'Middle Blocker'), (36, 9, 'Libero'),
(37, 10, 'Setter'), (37, 1, 'Outside Hitter'), (37, 2, 'Middle Blocker'), (37, 3, 'Defensive Specialist'),
(38, 4, 'Setter'), (38, 5, 'Outside Hitter'), (38, 6, 'Middle Blocker'), (38, 7, 'Libero'),
(39, 8, 'Setter'), (39, 9, 'Outside Hitter'), (39, 10, 'Middle Blocker'), (39, 1, 'Opposite Hitter'),
(40, 4, 'Setter'), (40, 6, 'Outside Hitter'), (40, 8, 'Middle Blocker'), (40, 10, 'Libero'),
(41, 2, 'Setter'), (41, 4, 'Outside Hitter'), (41, 6, 'Middle Blocker'), (41, 8, 'Defensive Specialist'),
(42, 1, 'Setter'), (42, 3, 'Outside Hitter'), (42, 5, 'Middle Blocker'), (42, 7, 'Libero'),
(43, 9, 'Setter'), (43, 10, 'Outside Hitter'), (43, 2, 'Middle Blocker'), (43, 4, 'Opposite Hitter'),
(44, 5, 'Setter'), (44, 7, 'Outside Hitter'), (44, 9, 'Middle Blocker'), (44, 1, 'Libero'),
(45, 3, 'Setter'), (45, 5, 'Outside Hitter'), (45, 7, 'Middle Blocker'), (45, 9, 'Defensive Specialist'),
(46, 2, 'Setter'), (46, 4, 'Outside Hitter'), (46, 6, 'Middle Blocker'), (46, 8, 'Libero'),
(47, 10, 'Setter'), (47, 1, 'Outside Hitter'), (47, 3, 'Middle Blocker'), (47, 5, 'Opposite Hitter'),
(48, 6, 'Setter'), (48, 8, 'Outside Hitter'), (48, 10, 'Middle Blocker'), (48, 2, 'Libero'),
(49, 4, 'Setter'), (49, 6, 'Outside Hitter'), (49, 8, 'Middle Blocker'), (49, 10, 'Defensive Specialist'),
(50, 1, 'Setter'), (50, 3, 'Outside Hitter'), (50, 5, 'Middle Blocker'), (50, 7, 'Libero'),
(51, 9, 'Setter'), (51, 2, 'Outside Hitter'), (51, 4, 'Middle Blocker'), (51, 6, 'Opposite Hitter'),
(52, 7, 'Setter'), (52, 9, 'Outside Hitter'), (52, 1, 'Middle Blocker'), (52, 3, 'Libero'),
(53, 5, 'Setter'), (53, 7, 'Outside Hitter'), (53, 9, 'Middle Blocker'), (53, 1, 'Defensive Specialist'),
(54, 2, 'Setter'), (54, 4, 'Outside Hitter'), (54, 6, 'Middle Blocker'), (54, 8, 'Libero'),
(55, 10, 'Setter'), (55, 3, 'Outside Hitter'), (55, 5, 'Middle Blocker'), (55, 7, 'Opposite Hitter');
-- Insert data into EmailLogs table
INSERT INTO EmailLogs (emailDate, senderLocationID, receiverMemberID, subject, bodyPreview) VALUES 
('2024-01-15', 1, 1, 'Welcome to Pallet Club!', 'Dear Pikachu, welcome to our volleyball club! We are excited to have you join...'),
('2024-01-20', 2, 2, 'Training Schedule Update', 'Hi Charmander, please note that our training schedule has been updated for...'),
('2024-02-01', 3, 3, 'Game Reminder', 'Hello Bulbasaur, this is a reminder about the upcoming game on February 15th...'),
('2024-02-10', 4, 4, 'Payment Due Notice', 'Dear Squirtle, your membership payment for 2024 is now due. Please make...'),
('2024-02-15', 5, 5, 'Team Selection', 'Hi Jigglypuff, congratulations! You have been selected for the starting...'),
('2024-03-01', 6, 6, 'Equipment Check', 'Hello Meowth, please remember to bring your volleyball gear for the next...'),
('2024-03-10', 7, 7, 'Match Results', 'Dear Psyduck, here are the results from last week''s matches. Our team...'),
('2024-03-20', 8, 8, 'Injury Report', 'Hi Snorlax, we hope you are recovering well from your recent injury...'),
('2024-04-01', 9, 9, 'Tournament Invitation', 'Hello Eevee, we are pleased to invite you to participate in the upcoming...'),
('2024-04-15', 10, 10, 'Season Summary', 'Dear Mewtwo, as we approach the end of the season, here is a summary...'),
('2024-05-01', 1, 2, 'Cross-Location Training', 'Hi Charmander, we are organizing a cross-location training session...'),
('2024-05-10', 2, 3, 'Volleyball Workshop', 'Hello Bulbasaur, we are hosting a special volleyball skills workshop...'),
('2024-06-01', 3, 4, 'Summer Camp Registration', 'Dear Squirtle, registration is now open for our summer volleyball camp...'),
('2024-06-15', 4, 5, 'Equipment Donation', 'Hi Jigglypuff, thank you for your generous equipment donation to the club...'),
('2024-07-01', 5, 6, 'Championship Preparation', 'Hello Meowth, we are beginning our preparation for the championship...'),
('2024-07-15', 6, 7, 'Volunteer Opportunity', 'Dear Psyduck, we have a great volunteer opportunity for you at the upcoming...'),
('2024-08-01', 7, 8, 'New Member Welcome', 'Hi Snorlax, we would like you to help welcome our new members this month...'),
('2024-08-10', 8, 9, 'Award Ceremony', 'Hello Eevee, you are cordially invited to our annual award ceremony...'),
('2024-08-20', 9, 10, 'Feedback Request', 'Dear Mewtwo, we value your opinion and would appreciate your feedback...'),
('2024-08-25', 10, 1, 'Season End Party', 'Hi Pikachu, join us for our end-of-season celebration party next week...'),
('2024-01-25', 1, 3, 'Skill Assessment', 'Hello Bulbasaur, we would like to schedule a skill assessment session...'),
('2024-02-05', 2, 4, 'Nutrition Workshop', 'Dear Squirtle, join us for a nutrition workshop designed for athletes...'),
('2024-02-20', 3, 5, 'Travel Team Selection', 'Hi Jigglypuff, you are being considered for our travel team this season...'),
('2024-03-05', 4, 6, 'Equipment Return', 'Hello Meowth, please remember to return the borrowed equipment by Friday...'),
('2024-03-15', 5, 7, 'Parent Meeting', 'Dear Psyduck, there will be a parent meeting next Tuesday at 7 PM...'),
('2024-03-25', 6, 8, 'Medical Clearance', 'Hi Snorlax, your medical clearance forms are due before the next practice...'),
('2024-04-05', 7, 9, 'Team Photo Day', 'Hello Eevee, team photo day is scheduled for this Saturday at 10 AM...'),
('2024-04-20', 8, 10, 'Fundraising Event', 'Dear Mewtwo, we are organizing a fundraising event and need volunteers...'),
('2024-05-05', 9, 1, 'Achievement Recognition', 'Hi Pikachu, congratulations on your recent achievement in the tournament...'),
('2024-05-15', 10, 2, 'Summer Training Camp', 'Hello Charmander, registration for summer training camp is now open...');
-- Insert data into SecondaryFamilyMembers table
INSERT INTO SecondaryFamilyMembers (firstName, lastName, dateOfBirth, socialSecurityNumber, medicareCardNumber, telephoneNumber, address, city, province, postalCode, email, relationship, primaryFamilyMemberID) VALUES 
('Ash', 'Ketchum', '1995-04-01', 'SSN901234567', 'MED901234567', '555-1001', '1 Oak Street', 'Pallet Town', 'Kanto', 'K1A0A6', 'ash.ketchum@pokemon.com', 'Child', 1),
('Delia', 'Ketchum', '1970-03-15', 'SSN901234568', 'MED901234568', '555-1002', '1 Oak Street', 'Pallet Town', 'Kanto', 'K1A0A6', 'delia.ketchum@pokemon.com', 'Spouse', 1),
('May', 'Maple', '1998-07-20', 'SSN901234569', 'MED901234569', '555-1003', '25 Water Road', 'Cerulean City', 'Kanto', 'K2B1B7', 'may.maple@pokemon.com', 'Child', 2),
('Norman', 'Maple', '1972-11-10', 'SSN901234570', 'MED901234570', '555-1004', '25 Water Road', 'Cerulean City', 'Kanto', 'K2B1B7', 'norman.maple@pokemon.com', 'Spouse', 2),
('Brock', 'Harrison', '1996-02-28', 'SSN901234571', 'MED901234571', '555-1005', '10 Harbor Street', 'Vermilion City', 'Kanto', 'K3C2C8', 'brock.harrison@pokemon.com', 'Child', 1),
('Flannery', 'Harrison', '1973-08-05', 'SSN901234572', 'MED901234572', '555-1006', '10 Harbor Street', 'Vermilion City', 'Kanto', 'K3C2C8', 'flannery.harrison@pokemon.com', 'Parent', 1),
('Misty', 'Waterflower', '1997-12-12', 'SSN901234573', 'MED901234573', '555-1007', '5 Green Avenue', 'Celadon City', 'Kanto', 'K4D3D9', 'misty.waterflower@pokemon.com', 'Sibling', 2),
('Daisy', 'Waterflower', '1975-06-18', 'SSN901234574', 'MED901234574', '555-1008', '5 Green Avenue', 'Celadon City', 'Kanto', 'K4D3D9', 'daisy.waterflower@pokemon.com', 'Parent', 2),
('Dawn', 'Pearl', '1999-09-14', 'SSN901234575', 'MED901234575', '555-1009', '15 Pink Boulevard', 'Fuchsia City', 'Kanto', 'K5E4E0', 'dawn.pearl@pokemon.com', 'Child', 1),
('Johanna', 'Pearl', '1974-01-22', 'SSN901234576', 'MED901234576', '555-1010', '15 Pink Boulevard', 'Fuchsia City', 'Kanto', 'K5E4E0', 'johanna.pearl@pokemon.com', 'Spouse', 1),
('Gary', 'Oak', '1995-11-05', 'SSN901234577', 'MED901234577', '555-1011', '30 Electric Road', 'Saffron City', 'Kanto', 'K6F5F1', 'gary.oak@pokemon.com', 'Grandchild', 2),
('Professor', 'Oak', '1950-04-30', 'SSN901234578', 'MED901234578', '555-1012', '30 Electric Road', 'Saffron City', 'Kanto', 'K6F5F1', 'prof.oak@pokemon.com', 'Grandparent', 2),
('Serena', 'Grace', '1998-05-17', 'SSN901234579', 'MED901234579', '555-1013', '2 Spirit Lane', 'Lavender Town', 'Kanto', 'K7G6G2', 'serena.grace@pokemon.com', 'Other', 1),
('Grace', 'Yvonne', '1976-10-03', 'SSN901234580', 'MED901234580', '555-1014', '2 Spirit Lane', 'Lavender Town', 'Kanto', 'K7G6G2', 'grace.yvonne@pokemon.com', 'Parent', 1),
('Paul', 'Shinji', '1996-08-25', 'SSN901234581', 'MED901234581', '555-1015', '88 Radio Street', 'Goldenrod City', 'Johto', 'J8H7H3', 'paul.shinji@pokemon.com', 'Sibling', 2);

-- QUERY #15 insert values
  INSERT INTO Teams (teamID, teamName, locationID, headCoachID) VALUES
 (601, 'Sandgem Town Turtwig', 1, 1),
 (602, 'Floaroma Town Chimchar', 1, 1),
 (603, 'Canalave City Piplup', 1, 1),
 (604, 'Solaceon Town Shinx', 1, 1),
 (605, 'Pastoria City Budew', 1, 1);

 INSERT INTO ClubMembers (memberID, firstName, lastName, dateOfBirth, isMinor, locationID,
     socialSecurityNumber, medicareCardNumber, telephoneNumber, address, city, province, postalCode)
 VALUES 
 (401, 'Turtwig', 'Leaf', '2000-06-15', FALSE, 1, 'SSN401', 'MCN401', '555-401', 'Sinnoh Route 1', 'Sandgem Town', 'Sinnoh', 'S1N 100'),
 (402, 'Chimchar', 'Leaf', '2001-06-15', FALSE, 1, 'SSN402', 'MCN402', '555-402', 'Sinnoh Route 2', 'Floaroma Town', 'Sinnoh', 'S1N 101'),
 (403, 'Piplup', 'Leaf', '2002-06-15', FALSE, 1, 'SSN403', 'MCN403', '555-403', 'Sinnoh Route 3', 'Canalave City', 'Sinnoh', 'S1N 102'),
 (404, 'Shinx', 'Leaf', '2003-06-15', FALSE, 1, 'SSN404', 'MCN404', '555-404', 'Sinnoh Route 4', 'Solaceon Town', 'Sinnoh', 'S1N 103'),
 (405, 'Budew', 'Leaf', '2004-06-15', FALSE, 1, 'SSN405', 'MCN405', '555-405', 'Sinnoh Route 5', 'Pastoria City', 'Sinnoh', 'S1N 104');

 INSERT INTO Payments (paymentID, memberID, paymentDate, paymentAmount, membershipYear)
 VALUES 
 (1101, 401, '2025-01-01', 200, 2025),
 (1102, 402, '2025-01-02', 200, 2025),
 (1103, 403, '2025-01-03', 200, 2025),
 (1104, 404, '2025-01-04', 200, 2025),
 (1105, 405, '2025-01-05', 200, 2025);

 INSERT INTO TeamFormations (formationID, teamID, team2ID, locationID, sessionDate, sessionTime,
     sessionType, sessionAddress, scoreTeam1, scoreTeam2)
 VALUES 
 (301, 601, 602, 1, '2025-03-10', '10:00:00', 'Game', 'Sinnoh Gym 1', 1, 2),
 (302, 602, 603, 1, '2025-03-11', '10:00:00', 'Game', 'Sinnoh Gym 2', 1, 2),
 (303, 603, 604, 1, '2025-03-12', '10:00:00', 'Game', 'Sinnoh Gym 3', 1, 2),
 (304, 604, 605, 1, '2025-03-13', '10:00:00', 'Game', 'Sinnoh Gym 4', 1, 2),
 (305, 605, 601, 1, '2025-03-14', '10:00:00', 'Game', 'Sinnoh Gym 5', 1, 2);

 INSERT INTO TeamPlayers (formationID, clubMemberID, role) VALUES
 (301, 401, 'Setter'),
 (302, 402, 'Setter'),
 (303, 403, 'Setter'),
 (304, 404, 'Setter'),
 (305, 405, 'Setter');

--  Query #14 insert values
q14: -- Club Members (all now majors, born before 2007, joined when they were minors)
INSERT INTO ClubMembers (memberID, firstName, lastName, dateOfBirth, isMinor, locationID,
    socialSecurityNumber, medicareCardNumber, telephoneNumber, address, city, province, postalCode)
VALUES
(201, 'Red', 'Ketchum', '2006-05-01', 0, 1, 'SSN201', 'MCN201', '555-201', 'Pallet Town', 'Kanto', 'QC', 'A1A1A1'),
(202, 'Leaf', 'Green', '2005-04-01', 0, 1, 'SSN202', 'MCN202', '555-202', 'Viridian', 'Kanto', 'QC', 'A1A1A2'),
(203, 'Gold', 'Johto', '2004-03-01', 0, 1, 'SSN203', 'MCN203', '555-203', 'Cherrygrove', 'Johto', 'QC', 'A1A1A3'),
(204, 'May', 'Hoenn', '2003-02-01', 0, 1, 'SSN204', 'MCN204', '555-204', 'Littleroot', 'Hoenn', 'QC', 'A1A1A4'),
(205, 'Lucas', 'Sinnoh', '2002-01-01', 0, 1, 'SSN205', 'MCN205', '555-205', 'Sandgem', 'Sinnoh', 'QC', 'A1A1A5');

-- Family Members
INSERT INTO FamilyMembers (familyMemberID, firstName, lastName, dateOfBirth, socialSecurityNumber, medicareCardNumber, telephoneNumber, address, city, province, postalCode, email)
VALUES
(301, 'Red Dad', 'Ketchum', '1975-01-01', 'FSSN1', 'FMCN1', '555-301', 'X1', 'City', 'QC', 'Z1Z1Z1', 'red@email.com'),
(302, 'Leaf Mom', 'Green', '1976-01-01', 'FSSN2', 'FMCN2', '555-302', 'X2', 'City', 'QC', 'Z2Z2Z2', 'leaf@email.com'),
(303, 'Gold Dad', 'Johto', '1977-01-01', 'FSSN3', 'FMCN3', '555-303', 'X3', 'City', 'QC', 'Z3Z3Z3', 'gold@email.com'),
(304, 'May Mom', 'Hoenn', '1978-01-01', 'FSSN4', 'FMCN4', '555-304', 'X4', 'City', 'QC', 'Z4Z4Z4', 'may@email.com'),
(305, 'Lucas Mom', 'Sinnoh', '1979-01-01', 'FSSN5', 'FMCN5', '555-305', 'X5', 'City', 'QC', 'Z5Z5Z5', 'lucas@email.com');

-- MemberFamilyRelations
INSERT INTO MemberFamilyRelations (memberID, familyMemberID) VALUES
(201, 301), (202, 302), (203, 303), (204, 304), (205, 305);

-- Payments — first payment made when they were minors (before 18), active in 2025
INSERT INTO Payments (paymentID, memberID, paymentDate, paymentAmount, membershipYear)
VALUES
(501, 201, '2022-05-01', 200, 2022),  -- joined at age 16
(502, 201, '2025-01-01', 200, 2025),
(503, 202, '2021-04-01', 200, 2021),
(504, 202, '2025-01-02', 200, 2025),
(505, 203, '2020-03-01', 200, 2020),
(506, 203, '2025-01-03', 200, 2025),
(507, 204, '2019-02-01', 200, 2019),
(508, 204, '2025-01-04', 200, 2025),
(509, 205, '2018-01-01', 200, 2018),
(510, 205, '2025-01-05', 200, 2025);